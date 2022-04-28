//
//  ScheduleView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    let backgroundColor = Color("Background")
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.lessons) { lesson in
                    LessonView(lesson: lesson)
                        .contextMenu {
                            VStack {
                                Button(action: {
                                    viewModel.deleteLesson(by: lesson.id)
                                }, label: {
                                    HStack {
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                })
                                
                                Button(action: {
                                    //
                                }, label: {
                                    HStack {
                                        Text("Edit")
                                        Image(systemName: "square.and.pencil")
                                    }
                                })
                            }
                        }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 110)
            }
            .navigationTitle("Расписание")
            .background(backgroundColor.ignoresSafeArea())
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
