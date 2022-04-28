//
//  TextStyles.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct TitleTextStyle: ViewModifier {
    let text: String
    
    func body(content: Content) -> some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
    }
}

struct BodyTextStyle: ViewModifier {
    let text: String
    
    func body(content: Content) -> some View {
        Text(text)
            .font(.body)
            .fontWeight(.semibold)
    }
}

struct CalloutTextStyle: ViewModifier {
    let text: String
    
    func body(content: Content) -> some View {
        Text(text)
            .font(.callout)
            .fontWeight(.light)
    }
}

struct ScalableTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
}

extension Text {
    func titleTextStyle(text: String) -> some View {
        self.modifier(TitleTextStyle(text: text))
    }
    
    func bodyTextStyle(text: String) -> some View {
        self.modifier(BodyTextStyle(text: text))
    }
    
    func calloutTextStyle(text: String) -> some View {
        self.modifier(CalloutTextStyle(text: text))
    }
}

extension View {
    func scalableTextStyle() -> some View {
        self.modifier(ScalableTextStyle())
    }
}
