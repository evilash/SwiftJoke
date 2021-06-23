//
//  JokeAndPunchLineView.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 6/18/21.
//

import SwiftUI

struct JokeAndPunchLineView: View {
    @ObservedObject private var tell = JokeViewModel()
    @Binding var jokeType: JokeType
    
    var body: some View {
        VStack {
            Label(text: tell.joke.setup)
            Label(text: tell.joke.punchline)
        }.onChange(of: jokeType) { type in
            tell.fetchJoke(of: type)
        }
    }
}

struct JokeAndPunchLineView_Previews: PreviewProvider {
    static var previews: some View {
        JokeAndPunchLineView(jokeType: .constant(.general))
    }
}
