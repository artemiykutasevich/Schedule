//
//  LessonType.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import Foundation

enum LessonType: String, CaseIterable, Identifiable {
    var id: LessonType { self }
    
    case laboratory = "Лабораторная"
    case practice = "Практика"
    case lecture = "Лекция"
}
