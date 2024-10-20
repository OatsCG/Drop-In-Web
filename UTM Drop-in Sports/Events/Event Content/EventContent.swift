//
//  EventContent.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import SwiftUI

struct EventContent: View {
    @Binding var showingSheet: Bool
    @Binding var event: Event
    
    var body: some View {
        VStack {
            Button(action: {
                showingSheet = false
            }) {
                Image(systemName: "chevron.compact.down")
                    .foregroundStyle(.tertiary)
                    .font(.title)
            }
            .buttonStyle(.plain)
            .padding()
            
            ScrollView {
                VStack {
                    EventContentImage(event: event)
                        .padding(.bottom, 18)
                    EventContentHeader(event: event)
                    Divider()
                        .padding(.vertical, 15)
                    EventContentBody(event: event)
                }
                .padding(.bottom, 50)
                .safeAreaPadding()
            }
        }
    }
}
