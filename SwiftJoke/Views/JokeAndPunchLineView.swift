//
//  JokeAndPunchLineView.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 6/18/21.
//

import SwiftUI

struct JokeAndPunchLineView: View {
    @ObservedObject private var joke = JokeViewModel()
    @Binding var jokeType: JokeType
    
    var body: some View {
        VStack {
            SetupText(setup: joke.setup)
            PunchlineText(punchline: joke.punchline)
        }.onChange(of: jokeType) { type in
            joke.fetchJoke(of: type)
        }
    }
}

struct JokeAndPunchLineView_Previews: PreviewProvider {
    static var previews: some View {
        JokeAndPunchLineView(jokeType: .constant(.general))
    }
}
