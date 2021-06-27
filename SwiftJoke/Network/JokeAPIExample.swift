//
//  JokeAPIExample.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 6/27/21.
//
// Jokes are being supplied by https://dadjokes.io/

import Foundation

struct JokeAPIExample {
    private struct Headers {
        struct Keys {
            static let host = "x-rapidapi-host"
            static let apiKey = "x-rapidapi-key"
        }
        
        struct Values {
            static let host = "dad-jokes.p.rapidapi.com"
            static let apiKey = "PUT-API-KEY-HERE"
        }
    }
    
    private static let filter = "limit=1"
    private static let jokeTypePath = "/joke/type/"
    private static let randomJokePath = "/random/joke"
    private static let url = "https://dad-jokes.p.rapidapi.com"
    static let headers = [Headers.Keys.host: Headers.Values.host,
                          Headers.Keys.apiKey: Headers.Values.apiKey]
    
    static func url(using type: JokeType) -> URL? {
        type != .random ? URL(string: "\(url)\(jokeTypePath)\(type.id)?\(filter)") :
            URL(string: "\(url)\(randomJokePath)")
    }
}
