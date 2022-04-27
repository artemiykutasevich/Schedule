//
//  DatabaseManager.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import Foundation
import RealmSwift

class DatabaseManager {
    static var databaseManager = DatabaseManager()
    private init() { /* Singleton */ }
    
    @ObservedResults(DatabaseLesson.self) var savedLessons
    
    private let realm = try! Realm()
    
    func saveLesson(lesson: LessonModel) {
        let object = DatabaseLesson()
        object.id = lesson.id
        object.lessonDayInWeek = lesson.lessonDayInWeek.rawValue
        object.lessonStartAt = lesson.lessonStartAt
        object.lessonName = lesson.lessonName
        object.lessonType = lesson.lessonType.rawValue
        object.lessonClass = lesson.lessonClass
        object.teacherLastName = lesson.teacherLastName
        
        saveData(object: object)
    }
    
    private func saveData(object: Object) {
        try! realm.write {
            realm.add(object)
        }
    }
}
