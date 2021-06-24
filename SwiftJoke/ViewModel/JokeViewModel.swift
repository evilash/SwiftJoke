//
//  JokeViewModel.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/29/21.
//

import Combine
import Foundation

class JokeViewModel: ObservableObject {
    @Published var setup = "Select a joke type below!"
    @Published var punchline = ""
    
    var cancellable: AnyCancellable?
    private let service = JokeService()
    private let punchlineDelay = 2.0
    
    func fetchJoke(of jokeType: JokeType) {
        setup = ""
        punchline = ""
        
        cancellable = service.getJokeReponse(of: jokeType)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { response in
                guard let jokeBody = response.body.first else { return }
                self.setup = jokeBody.setup
                Timer.scheduledTimer(withTimeInterval: self.punchlineDelay, repeats: false) { timer in
                    self.punchline = jokeBody.punchline
                }
            })
    }
}
