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
    
    func newLesson(lesson: LessonModel) {
        let object = setUp(databaseLesson: DatabaseLesson(), from: lesson)
        
        try! realm.write {
            realm.add(object)
        }
    }
    
    func deleteLesson(with idCode: UUID) {
        let object = findDatabaseLesson(by: idCode)
        
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func changeLesson(lesson: LessonModel) {
        let object = findDatabaseLesson(by: lesson.id)
        
        try! realm.write {
            setUp(databaseLesson: object, from: lesson)
        }
    }
    
    private func findDatabaseLesson(by idCode: UUID) -> DatabaseLesson {
        let databaseLesson = realm.objects(DatabaseLesson.self).where{$0.id == idCode}.first!
        return databaseLesson
    }
    
    private func setUp(databaseLesson: DatabaseLesson, from lesson: LessonModel) -> DatabaseLesson {
        databaseLesson.id = lesson.id
        databaseLesson.lessonDayInWeek = lesson.lessonDayInWeek.rawValue
        databaseLesson.lessonStartAt = lesson.lessonStartAt
        databaseLesson.lessonName = lesson.lessonName
        databaseLesson.lessonType = lesson.lessonType.rawValue
        databaseLesson.lessonClass = lesson.lessonClass
        databaseLesson.teacherLastName = lesson.teacherLastName
        return databaseLesson
    }
}
