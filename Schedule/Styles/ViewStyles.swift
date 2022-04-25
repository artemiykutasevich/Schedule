//
//  ViewStyles.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct ViewInnerShadowStyle: ViewModifier {
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.white, lineWidth: 1)
                    .shadow(color: .primary, radius: 3, x: 3, y: 3)
                    .shadow(color: .white, radius: 3, x: -3, y: -3)
                    .clipShape(
                        RoundedRectangle(cornerRadius: cornerRadius)
                    )
            )
    }
}

struct ViewDropShadowStyle: ViewModifier {
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .shadow(color: .white.opacity(0.5), radius: 3, x: -3, y: -3)
                    .shadow(color: .primary.opacity(0.5), radius: 3, x: 3, y: 3)
            )
    }
}

extension View {
    func innerShadow(cornerRadius: CGFloat = 25) -> some View {
        self.modifier(ViewInnerShadowStyle(cornerRadius: cornerRadius))
    }
    
    func dropShadow(cornerRadius: CGFloat = 25) -> some View {
        self.modifier(ViewDropShadowStyle(cornerRadius: cornerRadius))
    }
}
