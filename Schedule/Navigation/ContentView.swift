//
//  ContentView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .schedule
    @State private var sheetIsActive = false
    
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
            .sheet(isPresented: $sheetIsActive) {
                AddLessonView()
            }
            TabBar()
            
            if selectedTab == .schedule {
                Button(action: {
                    sheetIsActive = true
                }, label: {
                    Text("")
                        .bodyTextStyle(text: "новое занятие")
                        .foregroundColor(.primary)
                })
                .buttonNeumorphismStyle()
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                .offset(y: -60)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
