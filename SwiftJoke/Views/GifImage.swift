//
//  GifImage.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 1/11/21.
//

import SwiftUI

struct GifImage: View {
    struct ImageSize {
        static let width: CGFloat = 300
        static let height: CGFloat = 250
    }
    
    var body: some View {
        Image(systemName: "square.and.arrow.up")
            .frame(width: ImageSize.width, height: ImageSize.height, alignment: .center)
    }
}
