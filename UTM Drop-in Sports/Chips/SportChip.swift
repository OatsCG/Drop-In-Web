//
//  SportChip.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import SwiftUI

struct SportChip: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var categoryParser: CategoryParser
    var category: Category
    @State var favourited: Bool = false
    
    var body: some View {
        Button(action: {
            withAnimation(.interactiveSpring) {
                category.selected.toggle()
            }
            categoryParser.updateDisplayEvents(maxDays: 14)
        }) {
            HStack {
                Image(systemName: category.symbol)
                    .symbolEffect(.bounce, value: category.selected)
                Text(category.title)
                    .fixedSize(horizontal: false, vertical: true)
                if favourited {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
                .foregroundStyle(category.selected ? .white : (colorScheme == .dark ? .white : .black))
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background {
                    if colorScheme == .dark {
                        if category.selected {
                            Capsule(style: .circular)
                                .fill(.primaryUTM)
                                .stroke(.quaternary, lineWidth: 2)
                        } else {
                            Capsule(style: .circular)
                                .fill(.white.opacity(0.05))
                                .stroke(.quaternary, lineWidth: 1)
                        }
                    } else {
                        if category.selected {
                            Capsule(style: .circular)
                                .fill(.primaryUTM)
                                .stroke(.quaternary, lineWidth: 2)
                        } else {
                            Capsule(style: .circular)
                                .fill(.white)
                                .stroke(.quaternary, lineWidth: 2)
                        }
                    }
                }
        }
        .buttonStyle(.plain)
    }
}
