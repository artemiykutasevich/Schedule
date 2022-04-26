//
//  AboutView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct AboutView: View {
    let backgroundColor = Color("Background")
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Schedule - Расписание")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                Group {
                    Text("")
                        .bodyTextStyle(text: "Данное приложение написано на языке Swift. В качестве основного фреймворка выступает SwiftUI.")
                    Text("Фреймворк **SwiftUI** был представлен компанией Apple в 2019 году на WWDC.")
                        .fontWeight(.light)
                    Text("")
                        .bodyTextStyle(text: "Архитектурным паттерном выступает MVVM. Данные о занятиях сохраняются в базу данных Realm.")
                    Text("**Realm** - это база данных, которая ориентирована на мобильные устройства. Владельцем Realm'а является компания MongoDB.")
                        .fontWeight(.light)
                }
                .padding([.leading, .trailing, .bottom])
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 70)
            }
            .background(backgroundColor.ignoresSafeArea())
            .navigationTitle("О приложении")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
