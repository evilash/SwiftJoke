//
//  JokePicker.swift
//  SwiftJoke
//
//  Created by Matt M Smith on 2/8/21.
//

import SwiftUI

struct JokePicker: View {
    private enum JokeType: String, CaseIterable, Identifiable {
        case general
        case knock = "knock-knock"
        case programming
        case random
        var id: String { self.rawValue }
    }
    
    private let label = "Joke Type"
    
    @State private var selectedType = JokeType.general
    
    var body: some View {
        Picker(label, selection: $selectedType) {
            ForEach(JokeType.allCases) { type in
                Text(type.id)
            }
        }
    }
}

struct JokePicker_Previews: PreviewProvider {
    static var previews: some View {
        JokePicker()
    }
}
