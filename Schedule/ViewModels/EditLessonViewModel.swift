//
//  EditLessonViewModel.swift
//  Schedule
//
//  Created by Artem Kutasevich on 28.04.22.
//

import SwiftUI

class EditLessonViewModel: ObservableObject {
    private let databaseManager = DatabaseManager.databaseManager
    
    func saveChanges(from lesson: LessonModel) {
        databaseManager.saveChanges(lesson: lesson)
    }
    
    func deleteLesson(by idCode: UUID) {
        databaseManager.deleteLesson(with: idCode)
    }
}
