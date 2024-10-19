//
//  getDayColor.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

func getDayColor(_ startDate: Date, _ endDate: Date) -> Color {
    let calendar: Calendar = Calendar.current
    
    let middleDate: Date = startDate.addingTimeInterval(endDate.timeIntervalSince(startDate) / 2)
    let hour: Int = calendar.component(.hour, from: middleDate)

    switch hour {
    case 6..<12:
        return .orange
    case 12..<18:
        return .yellow
    default:
        return .blue
    }
}
