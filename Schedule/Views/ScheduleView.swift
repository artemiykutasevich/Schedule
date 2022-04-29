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
            ZStack {
                ScrollView {
                    ForEach(Week.allCases) { day in
                        Text("")
                            .titleTextStyle(text: day.rawValue)
                        
                        if viewModel.getLessonFor(day: day).isEmpty {
                            Text("")
                                .calloutTextStyle(text: "Сегодня занятий нет")
                        } else {
                            ForEach(viewModel.getLessonFor(day: day)) { lesson in
                                NavigationLink(destination: EditLessonView(lesson: lesson), label: {
                                    LessonView(lesson: lesson)
                                })
                                .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 110)
                }
                .navigationTitle("Расписание")
                .background(backgroundColor.ignoresSafeArea())
                .onAppear() {
                    viewModel.setUpLessons()
                }
                
                NavigationLink(destination: AddLessonView(), label: {
                    Text("")
                        .bodyTextStyle(text: "новое занятие")
                        .foregroundColor(.primary)
                        .buttonNeumorphismStyle()
                })
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                .offset(y: -60)
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
