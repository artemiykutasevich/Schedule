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
    
    func deleteLesson(with idCode: UUID) {
        let object = realm.objects(DatabaseLesson.self).filter{$0.id == idCode}.first
        
        try! realm.write {
            if let obj = object {
                realm.delete(obj)
            }
        }
    }
    
    func saveChanges(lesson: LessonModel) {
        let object = realm.objects(DatabaseLesson.self).where{$0.id == lesson.id}.first!
        
        try! realm.write {
            object.lessonDayInWeek = lesson.lessonDayInWeek.rawValue
            object.lessonStartAt = lesson.lessonStartAt
            object.lessonName = lesson.lessonName
            object.lessonType = lesson.lessonType.rawValue
            object.lessonClass = lesson.lessonClass
            object.teacherLastName = lesson.teacherLastName
        }
    }
    
    private func findElement(by idCode: UUID) -> DatabaseLesson {
        var lesson = DatabaseLesson()
        
        for element in savedLessons {
            if element.id == idCode {
                lesson = element
            }
        }
        return lesson
    }
    
    private func saveData(object: Object) {
        try! realm.write {
            realm.add(object)
        }
    }
}
