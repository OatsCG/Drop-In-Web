//
//  LoadMoreEventsButton.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct LoadMoreEventsButton: View {
    @EnvironmentObject var categoryParser: CategoryParser
    
    var body: some View {
        HStack {
            if !categoryParser.isEventsExpandedToMax && categoryParser.events.count > 0 && categoryParser.groupedEvents.days.count == 14 {
                Spacer()
                Button(action: {
                    categoryParser.updateDisplayEvents(maxDays: nil)
                }) {
                    VStack {
                        Text("Load More Events...")
                        Text("Schedule Version: \(UserDefaults.standard.string(forKey: "version.txt") ?? "Unknown")")
                            .font(.caption2)
                    }
                }
                Spacer()
            }
        }
    }
}
