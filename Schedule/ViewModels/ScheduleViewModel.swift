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
    
    func setUpLessons() {
        lessons = []
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
    
    func getLessonsFor(day: Week) -> [LessonModel] {
         return lessons
            .filter{$0.lessonDayInWeek == day}
            .sorted{convertTimeToInt(from: $0.lessonStartAt) < convertTimeToInt(from: $1.lessonStartAt)}
    }
    
    private func convertTimeToInt(from date: Date) -> Int {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "HHmm"
        let timeInInt = Int(dataFormatter.string(from: date)) ?? 2359
        return timeInInt
    }
    
    private func getDay(from string: String) -> Week {
        var result = Week.Monday
        for day in Week.allCases {
            if day.rawValue == string {
                result = day
            }
        }
        return result
    }
    
    private func getLessonType(from string: String) -> LessonType {
        var result = LessonType.lecture
        for lesson in LessonType.allCases {
            if lesson.rawValue == string {
                result = lesson
            }
        }
        return result
    }
}
