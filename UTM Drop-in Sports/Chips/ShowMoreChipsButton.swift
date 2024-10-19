//
//  ShowMoreChipsButton.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct ShowMoreChipsButton: View {
    @EnvironmentObject var categoryParser: CategoryParser
    @Binding var maxRows: Int
    @Binding var isExpanded: Bool
    
    var body: some View {
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
