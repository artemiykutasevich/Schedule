//
//  Week.swift
//  Schedule
//
//  Created by Artem Kutasevich on 26.04.22.
//

import Foundation

enum Week: String, CaseIterable, Identifiable {
    var id: Week { self }
    
    case Monday = "Понедельник"
    case Tuesday = "Вторник"
    case Wednesday = "Среда"
    case Thursday = "Четверг"
    case Friday = "Пятница"
    case Saturday = "Суббота"
    case Sunday = "Воскресенье"
}
