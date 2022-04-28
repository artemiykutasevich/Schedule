//
//  ScheduleViewModel.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

class ScheduleViewModel: ObservableObject {
    @Published var lessons = [LessonModel]()
    
    private var databaseManager = DatabaseManager.databaseManager
    
    init() {
        for element in databaseManager.savedLessons {
            let lesson = LessonModel(
                id: element.id,
                lessonDayInWeek: getDay(from: element.lessonDayInWeek),
                lessonStartAt: element.lessonStartAt,
                lessonName: element.lessonName,
                lessonType: getLessonType(from: element.lessonType),
                lessonClass: element.lessonClass,
                teacherLastName: element.teacherLastName)
            lessons.append(lesson)
        }
    }
    
    func getDay(from string: String) -> Week {
        var result = Week.Monday
        for day in Week.allCases {
            if day.rawValue == string {
                result = day
            }
        }
        return result
    }
    
    func getLessonType(from string: String) -> LessonType {
        var result = LessonType.lecture
        for lesson in LessonType.allCases {
            if lesson.rawValue == string {
                result = lesson
            }
        }
        return result
    }
    
    func deleteLesson(by id: UUID) {
        lessons.removeAll(where: {$0.id == id})
        databaseManager.deleteLesson(with: id)
    }
}
