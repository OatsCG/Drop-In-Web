//
//  EventDayHeader.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct EventDayHeader: View {
    @Binding var isExpanded: Bool
    var day: DayEvents
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        HStack {
                            Text(relativeDateString(day.date))
                                .font(.title.bold())
                            Spacer()
                            Image(systemName: isExpanded ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.title2)
                                .foregroundStyle(.secondary)
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
                if relativeDaysUntilString(day.date) != "" {
                    HStack {
                        Text(relativeDaysUntilString(day.date))
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                }
            }
            .padding(.vertical, 10)
        }
        .background {
            Rectangle().fill(.background)
                .ignoresSafeArea()
                .shadow(color: .black.opacity(0.05), radius: 5, y: -5)
        }
    }
}
