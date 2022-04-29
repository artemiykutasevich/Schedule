//
//  LessonView2.swift
//  Schedule
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct LessonView2: View {
    let lesson: LessonModel
    
    var body: some View {
        HStack {
            VStack {
                Text("")
                    .bodyTextStyle(text: getTime(from: lesson.lessonStartAt))
                
                Text("")
                    .calloutTextStyle(text: getTime(from: lesson.lessonStartAt.addingTimeInterval(60 * 105)))
            }
            .frame(width: 50, alignment: .trailing)
            
            Rectangle()
                .frame(width: 10, height: 50)
                .foregroundColor(getLessonColor(type: lesson.lessonType))
            
            VStack(alignment: .leading) {
                Text("")
                    .bodyTextStyle(text: lesson.lessonName)
                Text("")
                    .calloutTextStyle(text: "\(lesson.lessonClass), \(lesson.teacherLastName)")
            }
            
            Spacer()
        }
    }
    
    func getLessonColor(type: LessonType) -> Color {
        switch type {
        case .laboratory:
            return .red
        case .practice:
            return .yellow
        case .lecture:
            return .green
        }
    }
    
    func getTime(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

struct LessonView2_Previews: PreviewProvider {
    static var previews: some View {
        LessonView2(lesson: LessonModel(
            id: UUID(),
            lessonDayInWeek: .Monday,
            lessonStartAt: Date(),
            lessonName: "Математика",
            lessonType: .lecture,
            lessonClass: "606",
            teacherLastName: "Кулешов"))
    }
}
