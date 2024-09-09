//
//  SportChips.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import SwiftUI

struct SportChips: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var categoryParser: CategoryParser
    @State var organizedCategories: [[Category]] = []
    @State var width: CGFloat = 100
    @State var maxRows: Int = 3
    @State var isExpanded: Bool = false
    @State var maxWidth: CGFloat = 300
    var body: some View {
        ZStack {
            VStack {
                FlexView(data: $categoryParser.categories, maxRows: $maxRows) { category in
                    SportChip(categoryParser: $categoryParser, category: category)
                }
                .padding(.bottom, 2)
                if isExpanded {
                    HStack {
                        Button(action: {
                            categoryParser.onlyWomens.toggle()
                            categoryParser.updateDisplayEvents()
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
                                    Image(systemName: category.symbol)
                                }
                                    
                                if (categoryParser.onlyWomens) {
                                    Image(systemName: "figure.stand.dress")
                                        .foregroundStyle(.blueUTMlight)
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
