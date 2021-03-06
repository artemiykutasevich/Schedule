//
//  EditLessonView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 28.04.22.
//

import SwiftUI

struct EditLessonView: View {
    let lesson: LessonModel
    @StateObject private var viewModel = EditLessonViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State var lessonName: String = ""
    @State var teacherLastName: String = ""
    @State var lessonClass: String = ""
    
    @State var lessonDayInWeek: Week = .Monday
    @State var lessonStartAt: Date = Date()
    @State var lessonType: LessonType = .lecture
    
    @State private var showingEditAlert = false
    @State private var showingDeleteAlert = false
    
    let backgroundColor = Color("Background")
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Название предмета", text: $lessonName)
                    .textFieldNeumorphismStyle()
                TextField("Фамилия преподавателя", text: $teacherLastName)
                    .textFieldNeumorphismStyle()
                TextField("Аудитория", text: $lessonClass)
                    .textFieldNeumorphismStyle()
                    .keyboardType(.numbersAndPunctuation)
            }
            .padding()
            
            VStack {
                HStack {
                    Text("")
                        .bodyTextStyle(text: "Выберите день недели")
                    Spacer()
                    Picker("", selection: $lessonDayInWeek) {
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
                viewModel.saveChanges(from: save())
                showingEditAlert = true
            }, label: {
                Text("")
                    .bodyTextStyle(text: "Сохранить изменения")
                    .foregroundColor(.primary)
            })
            .buttonNeumorphismStyle()
            .padding()
            
            Button(action: {
                showingDeleteAlert = true
            }, label: {
                Label("Удалить", systemImage: "trash")
                    .foregroundColor(.red)
            })
            .buttonNeumorphismStyle()
            .padding()
        }
        .onAppear() {
            setUpFields()
        }
        .alert("Изменения сохранены", isPresented: $showingEditAlert) {
            Button("Хорошо", role: .cancel) {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .alert("Удалить занятие?", isPresented: $showingDeleteAlert) {
            Button("Удалить", role: .destructive) {
                viewModel.deleteLesson(by: lesson.id)
                cleanFields()
                self.presentationMode.wrappedValue.dismiss()
            }
            Button("Оставить", role: .cancel) {}
        }
        .navigationTitle("Изменить занятие")
        .navigationBarTitleDisplayMode(.inline)
        .background(backgroundColor.ignoresSafeArea())
    }
    
    func save() -> LessonModel {
        let lesson = LessonModel(
            id: lesson.id,
            lessonDayInWeek: lessonDayInWeek,
            lessonStartAt: lessonStartAt,
            lessonName: lessonName,
            lessonType: lessonType,
            lessonClass: lessonClass,
            teacherLastName: teacherLastName)
        return lesson
    }
    
    func setUpFields() {
        lessonName = lesson.lessonName
        teacherLastName = lesson.teacherLastName
        lessonClass = lesson.lessonClass
        lessonDayInWeek = lesson.lessonDayInWeek
        lessonStartAt = lesson.lessonStartAt
        lessonType = lesson.lessonType
    }
    
    func cleanFields() {
        lessonName = ""
        teacherLastName = ""
        lessonClass = ""
        lessonDayInWeek = .Monday
        lessonStartAt = Date()
        lessonType = .lecture
    }
}

struct EditLessonView_Previews: PreviewProvider {
    static var previews: some View {
        EditLessonView(lesson: LessonModel(
            id: UUID(),
            lessonDayInWeek: .Friday,
            lessonStartAt: Date(),
            lessonName: "Kfkfk",
            lessonType: .practice,
            lessonClass: "404",
            teacherLastName: "fmfmf"))
    }
}
