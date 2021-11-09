//
//  ContentAPIService.swift
//  CatsAndDogs
//
//  Created by a.akhmadiev on 09.11.2021.
//

import Combine
import Foundation

protocol ContentAPIServiceProtocol {
    func getContentForCats() -> AnyPublisher<String, Error>
    func getContentForDogs() -> AnyPublisher<URL, Error>
}

final class ContentAPIService: ContentAPIServiceProtocol {

    // MARK: Private data structure

    private enum Constants {
        static let catsURL = "https://catfact.ninja/fact"
        static let dogsURL = "https://dog.ceo/api/breeds/image/random"
    }


    // MARK: Private properties

    private let decoder = JSONDecoder()


    // MARK: Public

    func getContentForCats() -> AnyPublisher<String, Error> {
        guard
            let url = URL(string: Constants.catsURL)
        else {
            return Fail(error: URLError(.resourceUnavailable)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .compactMap { $0.data }
            .decode(type: TextResponse.self, decoder: decoder)
            .compactMap({
                $0.fact
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getContentForDogs() -> AnyPublisher<URL, Error> {
        guard
            let url = URL(string: Constants.dogsURL)
        else {
            return Fail(error: URLError(.resourceUnavailable)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .compactMap { $0.data }
            .decode(type: URLResponse.self, decoder: decoder)
            .compactMap({
                URL(string: $0.message)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

