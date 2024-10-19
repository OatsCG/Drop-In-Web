//
//  getDaySelection.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import Foundation

func getDaySection(_ startDate: Date, _ endDate: Date) -> String {
    let calendar: Calendar = Calendar.current
    
    let middleDate: Date = startDate.addingTimeInterval(endDate.timeIntervalSince(startDate) / 2)
    let hour: Int = calendar.component(.hour, from: middleDate)

    switch hour {
    case 6..<12:
        return "sunrise"
    case 12..<18:
        return "sun.max"
    default:
        return "moon"
    }
}
