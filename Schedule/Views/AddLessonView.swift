//
//  AddLessonView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 26.04.22.
//

import SwiftUI

struct AddLessonView: View {
    @State private var lessonName = ""
    @State private var lessonClass = ""
    @State private var teacherLastName = ""
    
    @State private var selectedDay: Week = .Monday
    @State private var lessonStartAt = Date()
    @State private var lessonType: LessonType = .lecture
    
    let backgroundColor = Color("Background")
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("Название предмета", text: $lessonName)
                        .textFieldNeumorphismStyle()
                    TextField("Аудитория", text: $lessonClass)
                        .textFieldNeumorphismStyle()
                    TextField("Фамилия преподавателя", text: $teacherLastName)
                        .textFieldNeumorphismStyle()
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("")
                            .bodyTextStyle(text: "Выберите день недели")
                        Spacer()
                        Picker("", selection: $selectedDay) {
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
                        DatePicker("", selection: $lessonStartAt, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    
                    HStack {
                        Picker("", selection: $lessonType) {
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
                    // add logic
                }, label: {
                    Text("")
                        .bodyTextStyle(text: "Сохранить занятие")
                        .foregroundColor(.primary)
                })
                .buttonNeumorphismStyle()
                .padding()
            }
            .navigationTitle("Новое занятие")
            .background(backgroundColor.ignoresSafeArea())
        }
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
