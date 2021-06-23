//
//  ContentView.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var jokeType: JokeType = .general
    
    var body: some View {
        VStack {
            JokeAndPunchLineView(jokeType: $jokeType)
            JokePickerView(jokeType: $jokeType)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}
