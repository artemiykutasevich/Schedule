//
//  ScheduleView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.lessons) { lesson in
                    LessonView(lesson: lesson)
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 110)
            }
            .navigationTitle("Schedule")
            .background(Color("Background").ignoresSafeArea())
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
