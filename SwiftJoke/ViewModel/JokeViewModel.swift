//
//  JokeViewModel.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/29/21.
//

import Combine
import Foundation

class JokeViewModel: ObservableObject {
    @Published var joke = Joke(setup: "Select a joke type below!", punchline: "")
    
    var cancellable: AnyCancellable?
    private let service = JokeService()
    
    func fetchJoke(of jokeType: JokeType) {
        cancellable = self.service.getJokeReponse(of: jokeType)
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
            self.joke = Joke(setup: setup, punchline: punchline)
        })
    }
}
