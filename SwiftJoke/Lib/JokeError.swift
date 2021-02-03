//
//  JokeError.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/21/21.
//

import Foundation

enum JokeError: String, Error {
    case invalidURL = "Sorry, but we're all out of jokes. Try again later!"
    case statusCode = "Sorry, pal! You need 200 laughs to pass!"
    case missingSetup = "I'd love to tell you a story, but I don't know any!"
    case missingPunchline = "I forgot the whole point of this story!"
    case other = "More bad jokes to come...just not now."
    
    static func map(_ error: Error) -> JokeError {
      return (error as? JokeError) ?? .other
    }
}
