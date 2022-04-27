//
//  LessonView.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct LessonView: View {
    let lesson: DatabaseLesson
    let cornerRadius: CGFloat = 25
    let color = Color("Background")
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 10)
                .foregroundColor(getLessonColor())
            
            VStack(alignment: .leading) {
                Text("")
                    .titleTextStyle(text: lesson.lessonDayInWeek)
                Text("")
                    .bodyTextStyle(text: lesson.lessonStartAt)
            }
            
            Spacer()
            
            VStack {
                Text("")
                    .bodyTextStyle(text: lesson.lessonName)
                Text("")
                    .calloutTextStyle(text: lesson.lessonType)
                Text("")
                    .calloutTextStyle(text: lesson.lessonClass)
            }
            
            Spacer()
            
            VStack {
                Text("")
                    .bodyTextStyle(text: lesson.teacherLastName)
            }
        }
        .frame(height: 60)
        .padding()
        .background(color, in: RoundedRectangle(cornerRadius: cornerRadius))
        .innerShadow()
        .dropShadow()
        .padding([.leading, .trailing])
    }
    
    func getLessonColor() -> Color {
        switch lesson.lessonType {
        case "Лабораторная":
            return .red
        case "Практика":
            return .yellow
        case "Лекция":
            return .green
        default:
            return .primary
        }
    }
}
