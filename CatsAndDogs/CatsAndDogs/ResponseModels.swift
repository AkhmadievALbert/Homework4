//
//  ResponseModels.swift
//  CatsAndDogs
//
//  Created by a.akhmadiev on 09.11.2021.
//

import Foundation

struct URLResponse: Decodable {

    let message: String
}

struct TextResponse: Decodable {

    let fact: String
}
