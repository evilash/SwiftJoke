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
    
    let urlString = JokeAPI.url
    let headers = JokeAPI.headers
    
    func getJokeReponse() -> JokeResponsePublisher {
        let url = try! NetworkManager.build { urlString }
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        request.allHTTPHeaderFields = headers
        
        return session.dataTaskPublisher(for: request)
            .tryMap { response in
                guard let httpURLResponse = response.response as? HTTPURLResponse,
                      httpURLResponse.statusCode == 200 else {
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
