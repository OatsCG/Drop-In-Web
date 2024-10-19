//
//  SportChips.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import SwiftUI

struct SportChips: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var categoryParser: CategoryParser
    @State var organizedCategories: [[Category]] = []
    @State var maxRows: Int = 3
    @State var isExpanded: Bool = false
    @State var maxWidth: CGFloat = 300
    
    var body: some View {
        ZStack {
            VStack {
                FlexView(data: $categoryParser.categories, maxRows: $maxRows) { category in
                    SportChip(category: category)
                }
                .padding(.bottom, 2)
                if isExpanded {
                    HStack {
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
                        Spacer()
                    }
                }
                HStack {
                    Button(action: {
                        changeExpansion()
                    }) {
                        HStack {
                            if isExpanded {
                                Text("Show Less...")
                            } else {
                                Text("Show More...")
                                ForEach(categoryParser.categories.filter({ $0.selected }), id: \.self) { category in
                                    Image(systemName: category.symbol)
                                        .foregroundStyle(.blueUTM)
                                }
                                if categoryParser.onlyWomens {
                                    Image("figure.stand.dress")
                                        .foregroundStyle(.blueUTM)
                                }
                            }
                        }
                            .font(.footnote)
                    }
                    Spacer()
                }
            }
        }
    }
    func changeExpansion() {
        if maxRows == 3 {
            withAnimation {
                maxRows = .max
                isExpanded = true
            }
        } else {
            withAnimation {
                maxRows = 3
                isExpanded = false
            }
        }
    }
}
