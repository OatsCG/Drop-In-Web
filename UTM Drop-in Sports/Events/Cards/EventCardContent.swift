//
//  EventCardContent.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import SwiftUI

struct EventCardContent: View {
    @Binding var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: event.symbol)
                    .font(.title)
                Text(event.title)
                    .font(.title3 .bold())
                Spacer()
            }
            .foregroundStyle(.blueUTM)
            .padding(.bottom, 6)
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .symbolRenderingMode(.hierarchical)
                        Text(event.venue)
                    }
                    Spacer()
                }
                    .font(.subheadline .bold())
                    .padding(.bottom, 6)
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: event.relativeTimeDate.daySymbol)
                                .foregroundStyle(event.relativeTimeDate.daySymbolColor.mix(with: .primary, by: 0.1))
                            Text(event.relativeTimeDate.timeString)
                        }
                        if event.relativeTimeDate.isOngoing {
                            HStack {
                                Image(systemName: "record.circle")
                                    .font(.caption2)
                                    .symbolEffect(.pulse .byLayer, options: .repeat(.continuous))
                                Text("Ongoing")
                            }
                            .foregroundStyle(.green)
                        } else {
                            HStack {
                                Image(systemName: "clock")
                                    .symbolRenderingMode(.hierarchical)
                                    .opacity(0)
                                Text(event.relativeTimeDate.timeLeftString)
                                    .foregroundStyle(event.relativeTimeDate.timeLeftString == "Soon" ? .orange : .secondary)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "calendar")
                        .foregroundStyle(.secondary)
                    Text(event.relativeTimeDate.dateString)
                        .foregroundStyle(.secondary)
                }
                    .font(.footnote)
                    .foregroundStyle(.primary)
                
            }
            .padding(.leading, 10)
        }
        .padding(15)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.white.opacity(0.05))
                .stroke(.tertiary, lineWidth: 2)
        }
    }
}
