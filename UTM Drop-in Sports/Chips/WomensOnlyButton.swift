//
//  WomensOnlyButton.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct WomensOnlyButton: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var categoryParser: CategoryParser
    
    var body: some View {
        Button(action: {
            withAnimation(.interactiveSpring) {
                categoryParser.onlyWomens.toggle()
            }
            categoryParser.updateDisplayEvents(maxDays: 14)
        }) {
            HStack {
                Text("Women's Only")
                Image(systemName: categoryParser.onlyWomens ? "checkmark.square" : "square")
                    .contentTransition(.symbolEffect(.replace.offUp))
            }
            .foregroundStyle(categoryParser.onlyWomens ? .black : (colorScheme == .dark ? .white : .black))
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background {
                if colorScheme == .dark {
                    if categoryParser.onlyWomens {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.blueUTMlight.gradient)
                            .stroke(.blueUTMlight, lineWidth: 2)
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white.opacity(0.05))
                            .stroke(.blueUTMlight, lineWidth: 1)
                    }
                } else {
                    if categoryParser.onlyWomens {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.blueUTMlight.gradient)
                            .stroke(.blueUTMlight, lineWidth: 2)
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .stroke(.blueUTMlight, lineWidth: 2)
                    }
                }
            }
        }
            .buttonStyle(.plain)
    }
}
