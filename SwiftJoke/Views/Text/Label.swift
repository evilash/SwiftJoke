//
//  Label.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/9/21.
//

import SwiftUI

struct Label: View {
    let text: String
    var color: Color = .blue
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(color)
            .padding(8)
    }
}
