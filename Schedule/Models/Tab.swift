//
//  Tab.swift
//  Schedule
//
//  Created by Artem Kutasevich on 25.04.22.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(text: "Schedule", icon: "calendar", tab: .schedule),
    TabItem(text: "About", icon: "ellipsis", tab: .about)
]

enum Tab: String {
    case schedule
    case about
}
