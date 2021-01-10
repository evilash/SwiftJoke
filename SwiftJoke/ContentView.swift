//
//  ContentView.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Label(text: "Joke")
            Label(text: "Punchline")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
