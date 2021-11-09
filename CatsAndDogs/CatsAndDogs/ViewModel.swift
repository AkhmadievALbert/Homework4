//
//  ViewModel.swift
//  CatsAndDogs
//
//  Created by a.akhmadiev on 09.11.2021.
//

import UIKit

class ViewModel {
    var type: ContentType = .cats
    var text: String?
    var image: UIImage?
    var catsCount: Int = 0
    var dogsCount: Int = 0

    enum ContentType {
        case cats
        case dogs
    }
}
