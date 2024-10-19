//
//  relativeDateString.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import Foundation

func relativeDateString(_ date: Date) -> String {
    let calendar: Calendar = Calendar.current
    let today: Date = calendar.startOfDay(for: Date())
    let targetDate: Date = calendar.startOfDay(for: date)
    
    if calendar.isDate(today, inSameDayAs: targetDate) {
        return "Today"
    } else if let tomorrow: Date = calendar.date(byAdding: .day, value: 1, to: today), calendar.isDate(tomorrow, inSameDayAs: targetDate) {
        return "Tomorrow"
    } else {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        return dateFormatter.string(from: date)
    }
}
