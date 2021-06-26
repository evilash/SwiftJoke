//
//  JokeService.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/23/21.
//

import Combine
import Foundation

struct JokeService {
    typealias JokeResponsePublisher = AnyPublisher<JokeResponse, JokeError>
    
    private let timeout = 15.0
    private let successStatusCode = 200
    
    func getJokeReponse(of jokeType: JokeType) -> JokeResponsePublisher {
        guard let url = JokeAPI.url(using: jokeType) else {
            return Fail(error: .invalidURL)
                .eraseToAnyPublisher()
        }
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
        request.allHTTPHeaderFields = JokeAPI.headers
        
        return session.dataTaskPublisher(for: request)
            .tryMap { response in
                guard let httpURLResponse = response.response as? HTTPURLResponse,
                      httpURLResponse.statusCode == successStatusCode else {
                    throw JokeError.statusCode
                }
                
                return response.data
            }
            .decode(type: JokeResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .mapError { JokeError.map($0) }
            .eraseToAnyPublisher()
    }
}
