//
//  formatDateRange.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import Foundation

func formatDateRange(startDate: String, endDate: String) -> RelativeTimeDate {
    let dateFormatter: DateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    guard let start: Date = dateFormatter.date(from: startDate),
          let end: Date = dateFormatter.date(from: endDate) else {
        return RelativeTimeDate(startDate: Date(), timeString: "", dateString: "", daysLeftString: "", timeLeftString: "", isOngoing: false, isEventOver: false, daySymbol: "", daySymbolColor: .primary)
    }
    
    // Time String (e.g., "9:00am - 10:00am")
    let timeFormatter: DateFormatter = DateFormatter()
    timeFormatter.dateFormat = "h:mma"
    let startTime: String = timeFormatter.string(from: start).lowercased()
    let endTime: String = timeFormatter.string(from: end).lowercased()
    let timeString: String = "\(startTime) - \(endTime)"
    
    // Date String (e.g., "Tuesday Sept 2")
    let dateFormatterForDateString: DateFormatter = DateFormatter()
    dateFormatterForDateString.dateFormat = "EEEE MMM d"
    let dateString: String = dateFormatterForDateString.string(from: start)
    
    // Days Left String (e.g., "Today", "Tomorrow", "")
    let calendar: Calendar = Calendar.current
    let now: Date = Date()
    let hoursLeft: Int = Int(round(start.timeIntervalSince(now) / 3600))
    var timeLeftString: String = ""
    if hoursLeft >= 0 {
        if hoursLeft <= 1 {
            timeLeftString = "Soon"
        } else if hoursLeft <= 24 {
            timeLeftString = "In \(hoursLeft) hours"
        }
    }
    
    let daysLeftString: String
    if calendar.isDateInToday(start) {
        daysLeftString = "Today"
    } else if calendar.isDateInTomorrow(start) {
        daysLeftString = "Tomorrow"
    } else {
        daysLeftString = ""
    }
    
    // isOngoing
    let isOngoing: Bool = now >= start && now <= end
    
    // isEventOver
    let isEventOver: Bool = now > end
    
    return RelativeTimeDate(startDate: start, timeString: timeString, dateString: dateString, daysLeftString: daysLeftString, timeLeftString: timeLeftString, isOngoing: isOngoing, isEventOver: isEventOver, daySymbol: getDaySection(start, end), daySymbolColor: getDayColor(start, end))
}
