//
//  relativeDaysUntilString.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import Foundation

func relativeDaysUntilString(_ date: Date) -> String {
    let calendar: Calendar = Calendar.current
    let today: Date = calendar.startOfDay(for: Date())
    let targetDate: Date = calendar.startOfDay(for: date)
    
    guard let daysDifference: Int = calendar.dateComponents([.day], from: today, to: targetDate).day else {
        return ""
    }
    
    if daysDifference > 1 && daysDifference <= 7 {
        return "In \(daysDifference) days"
    } else {
        return ""
    }
}
