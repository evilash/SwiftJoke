//
//  ContentView.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/9/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var tell = JokeViewModel()
    
    var body: some View {
        VStack {
            GifImage()
            Label(text: self.tell.joke.setup)
            Label(text: self.tell.joke.punchline)
        }.onAppear {
            self.tell.fetchJoke()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}
