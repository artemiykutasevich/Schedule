//
//  AddLessonView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 26.04.22.
//

import SwiftUI

struct AddLessonView: View {
    @StateObject private var viewModel = AddLessonViewModel()
    
    let backgroundColor = Color("Background")
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Название предмета", text: $viewModel.lessonName)
                    .textFieldNeumorphismStyle()
                TextField("Фамилия преподавателя", text: $viewModel.teacherLastName)
                    .textFieldNeumorphismStyle()
                TextField("Аудитория", text: $viewModel.lessonClass)
                    .textFieldNeumorphismStyle()
                    .keyboardType(.numbersAndPunctuation)
            }
            .padding()
            
            VStack {
                HStack {
                    Text("")
                        .bodyTextStyle(text: "Выберите день недели")
                    Spacer()
                    Picker("", selection: $viewModel.selectedDay) {
                        ForEach(Week.allCases) { day in
                            Text(day.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
                
                HStack {
                    Text("")
                        .bodyTextStyle(text: "Выберите время")
                    Spacer()
                    DatePicker("", selection: $viewModel.lessonStartAt, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                HStack {
                    Picker("", selection: $viewModel.lessonType) {
                        ForEach(LessonType.allCases) { lesson in
                            Text(lesson.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                }
            }
            .padding()
            
            Button(action: {
                viewModel.saveLesson()
            }, label: {
                Text("")
                    .bodyTextStyle(text: "Сохранить занятие")
                    .foregroundColor(.primary)
            })
            .buttonNeumorphismStyle()
            .padding()
        }
        .navigationTitle("Новое занятие")
        .navigationBarTitleDisplayMode(.inline)
        .background(backgroundColor.ignoresSafeArea())
    }
}

struct AddLessonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddLessonView()
            AddLessonView()
                .preferredColorScheme(.dark)
        }
    }
}
