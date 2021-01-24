//
//  TenorResponse.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/21/21.
//

import Foundation

struct TenorResponse: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let title: String
    let media: [Media]
}

struct Media: Decodable {
    let gif: GIF
}

struct GIF: Decodable {
    let url: String
}
