//
//  AllEvents.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import Foundation

class AllEvents {
    var days: [DayEvents] = []
    
    init(events: [Event], maxDays: Int?) {
        var dayEventsList: [DayEvents] = []
        var currentDayEvents: DayEvents?
        
        let calendar: Calendar = Calendar.current
        for event in events {
            let eventDate: Date = calendar.startOfDay(for: event.relativeTimeDate.startDate)
            
            if let currentDay: Date = currentDayEvents?.date, currentDay == eventDate {
                currentDayEvents?.events.append(event)
            } else {
                if let currentDayEvents = currentDayEvents {
                    dayEventsList.append(currentDayEvents)
                }
                currentDayEvents = DayEvents(date: eventDate, events: [event])
            }
        }
        
        if let currentDayEvents = currentDayEvents {
            dayEventsList.append(currentDayEvents)
        }
        if let maxDays = maxDays {
            self.days = Array(dayEventsList.prefix(maxDays))
        } else {
            self.days = dayEventsList
        }
    }
}
