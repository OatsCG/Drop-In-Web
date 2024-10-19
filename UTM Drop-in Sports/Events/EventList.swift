//
//  EventList.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import SwiftUI

struct EventList: View {
    @EnvironmentObject var categoryParser: CategoryParser
    
    var body: some View {
        if categoryParser.events.isEmpty {
            VStack {
                Image(systemName: "flag.2.crossed")
                    .foregroundStyle(.secondary)
                    .imageScale(.large)
                    .font(.largeTitle)
                Text("No events found.")
                    .font(.title2 .bold())
                Text("Try selecting less filters.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
        } else {
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                ForEach($categoryParser.groupedEvents.days, id: \.date) { $day in
                    EventDaySection(day: $day)
                }
            }
        }
    }
}
