//
//  ViewModel.swift
//  CatsAndDogs
//
//  Created by a.akhmadiev on 09.11.2021.
//

import Combine
import Foundation

class ViewModel {

    // MARK: Published properties

    @Published var type: ContentType = .cats
    @Published var text: String?
    @Published var imageURL: URL?
    @Published var catsCount: Int = 0
    @Published var dogsCount: Int = 0

    enum ContentType {
        case cats
        case dogs
    }

    // MARK: Private properties

    private let service: ContentAPIServiceProtocol = ContentAPIService()
    private var disposables = Set<AnyCancellable>()


    // MARK: Public

    func fetchContent() {
        switch type {
        case .cats:
            service.getContentForCats()
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { [weak self] result in
                        guard let self = self else { return }
                        switch result {
                        case .failure:
                            self.text = nil
                        case .finished:
                            self.catsCount += 1
                            break
                        }
                    },
                    receiveValue: { [weak self] text in
                        guard let self = self else { return }
                        self.text = text
                    })
                .store(in: &disposables)

        case .dogs:
            service.getContentForDogs()
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { [weak self] result in
                        guard let self = self else { return }
                        switch result {
                        case .failure:
                            self.imageURL = nil
                        case .finished:
                            self.dogsCount += 1
                            break
                        }
                    },
                    receiveValue: { [weak self] url in
                        guard let self = self else { return }
                        self.imageURL = url
                    })
                .store(in: &disposables)
        }
    }
}
