//
//  DatabaseLesson.swift
//  Schedule
//
//  Created by Artem Kutasevich on 26.04.22.
//

import Foundation
import RealmSwift

class DatabaseLesson: Object, Identifiable {
    @Persisted var id: UUID
    @Persisted var lessonDayInWeek: String
    @Persisted var lessonStartAt: Date
    @Persisted var lessonName: String
    @Persisted var lessonType: String
    @Persisted var lessonClass: String
    @Persisted var teacherLastName: String
}
