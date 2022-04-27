//
//  ScheduleViewModel.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

class ScheduleViewModel: ObservableObject {
    @Published var lessons = DatabaseManager.databaseManager.savedLessons
}
