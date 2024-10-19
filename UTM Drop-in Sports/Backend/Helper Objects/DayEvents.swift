//
//  DayEvents.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import Foundation

struct DayEvents: Hashable {
    static func == (lhs: DayEvents, rhs: DayEvents) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    let id: UUID = UUID()
    let date: Date
    var events: [Event]
    
    init(date: Date, events: [Event]) {
        self.date = date
        self.events = events
    }
}
