//
//  JokeType.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 6/8/21.
//

import Foundation

enum JokeType: String, CaseIterable, Identifiable {
    case general = "general"
    case programming = "programming"
    case knockKnock = "knock-knock"
    
    var id: String { self.rawValue }
}
