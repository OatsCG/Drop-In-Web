//
//  EventDaySection.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct EventDaySection: View {
    @Binding var day: DayEvents
    @State var isExpanded: Bool = true
    
    var body: some View {
        Section(isExpanded: $isExpanded) {
            ForEach($day.events, id: \.id) { $event in
                EventCard(event: $event)
                    .transition(.blurReplace)
            }
        } header: {
            EventDayHeader(isExpanded: $isExpanded, day: day)
        }
    }
}
