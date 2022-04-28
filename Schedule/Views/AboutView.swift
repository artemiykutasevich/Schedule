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
                
                VStack(alignment: .leading) {
                    Text("")
                        .bodyTextStyle(text: "Данное приложение написано на языке Swift. В качестве основного фреймворка выступает SwiftUI.")
                        .padding(.bottom)
                    Text("Фреймворк **SwiftUI** был представлен компанией Apple в 2019 году на WWDC.")
                        .fontWeight(.light)
                        .padding(.bottom)
                    Text("")
                        .bodyTextStyle(text: "Архитектурным паттерном выступает MVVM. Данные о занятиях сохраняются в базу данных Realm.")
                        .padding(.bottom)
                    Text("**Realm** - это база данных, которая ориентирована на мобильные устройства. Владельцем Realm'а является компания MongoDB.")
                        .fontWeight(.light)
                        .padding(.bottom)
                    Text("")
                        .bodyTextStyle(text: "Данное приложение поддерживает два цветовых режима: светлый и тёмный. В зависимости от выбранного режима на устройстве, приложение будет менять свой стиль.")
                        .padding(.bottom)
                }
                .padding([.leading, .trailing])
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
