//
//  NetworkManager.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/21/21.
//

import Combine
import Foundation

struct NetworkManager {    
    static func build(url builder: () -> String) throws -> URL {
        let urlString = builder()
        
        guard let url = URL(string: urlString) else {
            throw JokeError.invalidURL
        }
        
        return url
    }
}
