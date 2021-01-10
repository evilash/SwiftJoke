//
//  Label.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/9/21.
//

import SwiftUI

struct Label: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding(8)
    }
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
        Label(text: "")
    }
}
