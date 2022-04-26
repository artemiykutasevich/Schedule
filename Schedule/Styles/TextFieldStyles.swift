//
//  TextFieldStyles.swift
//  Schedule
//
//  Created by Artem Kutasevich on 26.04.22.
//

import SwiftUI

struct TextFieldNeumorphismStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("Background"))
            .cornerRadius(25)
            .innerShadow()
            .dropShadow()
    }
}

extension TextField {
    func textFieldNeumorphismStyle() -> some View {
        self.modifier(TextFieldNeumorphismStyle())
    }
}
