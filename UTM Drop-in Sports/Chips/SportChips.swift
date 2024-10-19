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
                                if #available(iOS 17.0, *) {
                                    Image(systemName: categoryParser.onlyWomens ? "checkmark.square" : "square")
                                        .contentTransition(.symbolEffect(.replace.offUp))
                                } else {
                                    Image(systemName: categoryParser.onlyWomens ? "checkmark.square" : "square")
                                }
                            }
                            .foregroundStyle(categoryParser.onlyWomens ? .black : (colorScheme == .dark ? .white : .black))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background {
                                if colorScheme == .dark {
                                    if categoryParser.onlyWomens {
                                        if #available(iOS 16.0, *) {
                                            RoundedRectangle(cornerRadius: 8)
                                                .strokeBorder(.blueUTMlight, lineWidth: 2)
                                                .background(RoundedRectangle(cornerRadius: 8).fill(.blueUTMlight.gradient))
                                        } else {
                                            RoundedRectangle(cornerRadius: 8)
                                                .strokeBorder(.blueUTMlight, lineWidth: 2)
                                                .background(RoundedRectangle(cornerRadius: 8).fill(.blueUTMlight))
                                        }
                                    } else {
                                        RoundedRectangle(cornerRadius: 8)
                                            .strokeBorder(.blueUTMlight, lineWidth: 1)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.05)))
                                    }
                                } else {
                                    if categoryParser.onlyWomens {
                                        if #available(iOS 16.0, *) {
                                            RoundedRectangle(cornerRadius: 8)
                                                .strokeBorder(.blueUTMlight, lineWidth: 2)
                                                .background(RoundedRectangle(cornerRadius: 8).fill(.blueUTMlight.gradient))
                                        } else {
                                            RoundedRectangle(cornerRadius: 8)
                                                .strokeBorder(.blueUTMlight, lineWidth: 2)
                                                .background(RoundedRectangle(cornerRadius: 8).fill(.blueUTMlight))
                                        }
                                    } else {
                                        RoundedRectangle(cornerRadius: 8)
                                            .strokeBorder(.blueUTMlight, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
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
                    }) {
                        HStack {
                            if isExpanded {
                                Text("Show Less...")
                            } else {
                                Text("Show More...")
                                ForEach(categoryParser.categories.filter({ $0.selected }), id: \.self) { category in
                                    if #available(iOS 17.0, *) {
                                        Image(systemName: category.symbol)
                                            .foregroundStyle(.blueUTM)
                                    } else {
                                        Image(category.symbol)
                                            .foregroundStyle(.blueUTM)
                                    }
                                }
                                if (categoryParser.onlyWomens) {
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
}


#Preview {
    ContentView()
}
