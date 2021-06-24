//
//  PunchlineText.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 6/23/21.
//

import SwiftUI

struct PunchlineText: View {
    let punchline: String
    
    var body: some View {
        Label(text: punchline, color: .red)
            .animation(.easeIn)
    }
}

struct PunchlineText_Previews: PreviewProvider {
    static var previews: some View {
        PunchlineText(punchline: "not funny")
    }
}
