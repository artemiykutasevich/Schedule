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
