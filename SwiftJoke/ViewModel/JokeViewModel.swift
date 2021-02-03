//
//  JokeViewModel.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/29/21.
//

import Combine
import Foundation

class JokeViewModel: ObservableObject {
    @Published var joke = JokeModel(setup: "", punchline: "")
    
    var cancellable: AnyCancellable?
    private let service = JokeService()
    
    func fetchJoke() {
        cancellable = self.service.getJokeReponse()
            .sink(receiveCompletion: { (completion) in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { (response) in
            guard let jokeBody = response.body.first else { return }
            let setup = jokeBody.setup
            let punchline = jokeBody.punchline
            self.joke = JokeModel(setup: setup, punchline: punchline)
        })
    }
}
