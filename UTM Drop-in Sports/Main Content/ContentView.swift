//
//  ContentView.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var categoryParser: CategoryParser
    @State var searchField: String = ""
    @State var showNetworkAlert: Bool = false
    
    var body: some View {
        Group {
            MainNavigationView(showNetworkAlert: $showNetworkAlert)
        }
        .searchable(text: $searchField)
        .onChange(of: searchField) {
            categoryParser.searchField = searchField
            categoryParser.updateDisplayEvents(maxDays: 14)
        }
        .onAppear {
            Task {
                try? await Task.sleep(for: .seconds(5))
                await MainActor.run {
                    if (categoryParser.isUpdating) {
                        withAnimation {
                            showNetworkAlert = true
                        }
                    }
                }
            }
        }
    }
}
