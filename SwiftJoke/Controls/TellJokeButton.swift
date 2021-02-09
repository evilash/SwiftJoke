//
//  TellJokeButton.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 2/8/21.
//

import Foundation
import SwiftUI

struct TellJokeButton: View {
    let title = "Tell Joke"
    let jokeViewModel: JokeViewModel
    
    var body: some View {
        Button(action: {
            jokeViewModel.fetchJoke()
        }, label: {
            Text(title)
        })
    }
}
