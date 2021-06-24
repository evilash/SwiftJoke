//
//  SetupText.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 6/23/21.
//

import SwiftUI

struct SetupText: View {
    let setup: String
    
    var body: some View {
        Label(text: setup)
    }
}

struct SetupText_Previews: PreviewProvider {
    static var previews: some View {
        SetupText(setup: "is this funny?")
    }
}
