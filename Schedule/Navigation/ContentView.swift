//
//  ContentView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .schedule
    
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .schedule:
                    ScheduleView()
                case .about:
                    AboutView()
                }
            }
            TabBar()
            
            if selectedTab == .schedule {
                Button(action: {
                    
                }, label: {
                    Text("")
                        .bodyTextStyle(text: "add new lesson")
                        .foregroundColor(.primary)
                        .padding()
                        .background(Color("Background"), in: RoundedRectangle(cornerRadius: 25))
                        .innerShadow()
                        .dropShadow()
                })
                .padding([.leading, .trailing])
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                .offset(y: -60)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
