//
//  TenorManager.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/21/21.
//

import Combine
import Foundation

struct TenorManager {
    typealias TenorResponsePublisher = AnyPublisher<TenorResponse, JokeError>
    
    private let baseURL = TenorAPI.baseURL
    private let apiKey = TenorAPI.apiKey
    private let filters = TenorAPI.filters
    
    func getTenorConstructedUrlString(with query: String) -> String {
        let formattedQuery = query.replacingOccurrences(of: " ", with: "+")
        
        return "\(baseURL)?key=\(apiKey)&q=\(formattedQuery)&\(filters)"
    }
    
    func getTenorReponse(from urlWithPunchline: String) -> TenorResponsePublisher {
        let session = URLSession(configuration: .default)
        let url = try! NetworkManager.build { urlWithPunchline }
        
        return session.dataTaskPublisher(for: url)
            .tryMap { response in
                guard let httpURLResponse = response.response as? HTTPURLResponse,
                      httpURLResponse.statusCode == 200 else {
                    throw JokeError.statusCode
                }
                
                return response.data
            }
            .decode(type: TenorResponse.self, decoder: JSONDecoder())
            .mapError { JokeError.map($0) }
            .eraseToAnyPublisher()
    }
}
