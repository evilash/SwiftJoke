//
//  ContentView.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/9/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = JokeViewModel()
    
    var body: some View {
        VStack {
            Label(text: self.viewModel.joke.setup)
            Label(text: self.viewModel.joke.punchline)
            
            HStack {
                JokePicker()
                TellJokeButton(jokeViewModel: self.viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}
