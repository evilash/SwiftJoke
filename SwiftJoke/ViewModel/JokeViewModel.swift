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
    
    private struct Constant {
        static let dot = "."
    }
    
    private class Loading {
        static var indicator = ""
        static var counter = 0.0
    }
        
    var cancellable: AnyCancellable?
    private let service = JokeService()
    
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
                self.getDelayed(punchline: jokeBody.punchline)
            })
    }
    
    //MARK: - Helper Function
    private func getDelayed(punchline text: String, punchlineDelay: Double = 4.0) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.display(text, timer: timer, delay: punchlineDelay)
        }
    }
    
    private func display(_ punchline: String, timer: Timer, delay: Double) {
        if Loading.counter <= delay {
            self.punchline = Loading.indicator
            Loading.indicator.append(Constant.dot)
            Loading.counter = Loading.counter + 1
        } else {
            self.punchline = punchline
            timer.invalidate()
        }
    }
}
