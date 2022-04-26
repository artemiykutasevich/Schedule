//
//  ButtonStyles.swift
//  Schedule
//
//  Created by Artem Kutasevich on 26.04.22.
//

import SwiftUI

struct ButtonNeumorphismStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("Background"), in: RoundedRectangle(cornerRadius: 25))
            .innerShadow()
            .dropShadow()
    }
}

extension Button {
    func buttonNeumorphismStyle() -> some View {
        self.modifier(ButtonNeumorphismStyle())
    }
}
