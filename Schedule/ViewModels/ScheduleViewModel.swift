//
//  ScheduleViewModel.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

class ScheduleViewModel: ObservableObject {
    @Published var lessons = [LessonModel]()
    
    init() {
        let object = LessonModel(lessonStartAt: "9:00", lessonEndAt: "10:20", lessonName: "Предмет", lessonType: .laboratory, lessonClass: "аудитория", teacherLastName: "Фамилия")
        lessons.append(object)
        lessons.append(object)
        lessons.append(object)
    }
}
