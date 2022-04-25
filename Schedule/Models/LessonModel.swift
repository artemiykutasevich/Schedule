//
//  LessonModel.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import Foundation

struct LessonModel: Identifiable {
    let id = UUID()
    let lessonStartAt: String
    let lessonEndAt: String
    let lessonName: String
    let lessonType: LessonType
    let lessonClass: String
    let teacherLastName: String
}
