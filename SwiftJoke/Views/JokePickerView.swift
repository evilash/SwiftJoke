//
//  JokePickerView.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 6/7/21.
//

import SwiftUI

struct JokePickerView: View {
    @Binding var jokeType: JokeType
    
    var body: some View {
        HStack(spacing: 6.0) {
            Picker("", selection: $jokeType) {
                ForEach(JokeType.allCases) {
                    Text($0.id).tag($0)
                }
            }
        }
    }
}

struct JokePickerView_Previews: PreviewProvider {
    static var previews: some View {
        JokePickerView(jokeType: .constant(.general))
    }
}
