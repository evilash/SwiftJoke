//
//  JokeResponse.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/21/21.
//

import Foundation

struct JokeResponse: Decodable {
    let body: [Body]
}

struct Body: Decodable {
    let setup: String
    let punchline: String
}
