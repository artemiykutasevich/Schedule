//
//  AddLessonViewModel.swift
//  Schedule
//
//  Created by Artem Kutasevich on 26.04.22.
//

import SwiftUI

class AddLessonViewModel: ObservableObject {
    @Published var lessonName = ""
    @Published var teacherLastName = ""
    @Published var lessonClass = ""
    
    @Published var selectedDay: Week = .Monday
    @Published var lessonStartAt = Date()
    @Published var lessonType: LessonType = .lecture
    
    private let databaseManager = DatabaseManager.databaseManager
    
    func saveLesson() {
        let lessonObject = LessonModel(
            lessonDayInWeek: selectedDay,
            lessonStartAt: getTime(),
            lessonName: lessonName,
            lessonType: lessonType,
            lessonClass: lessonClass,
            teacherLastName: teacherLastName)
        databaseManager.saveLesson(lesson: lessonObject)
        
        clean()
    }
    
    private func getTime() -> String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "HH:mm"
        return dataFormatter.string(from: lessonStartAt)
    }
    
    private func clean() {
        lessonName = ""
        lessonClass = ""
        teacherLastName = ""
        selectedDay = .Monday
        lessonStartAt = Date()
        lessonType = .lecture
    }
}
