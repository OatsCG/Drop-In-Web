//
//  ContentView.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-05.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
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

struct MainNavigationView: View {
    @State var path: NavigationPath = NavigationPath()
    @Binding var showNetworkAlert: Bool

    var body: some View {
        NavigationStack(path: $path) {
            MainScrollView(showNetworkAlert: $showNetworkAlert)
                .navigationTitle(Text("UTM Drop-Ins"))
                .safeAreaPadding(.horizontal)
        }
    }
}


struct MainScrollView: View {
    @AppStorage("isTipVisible") var isTipVisible: Bool = true
    @EnvironmentObject var categoryParser: CategoryParser
    @Binding var showNetworkAlert: Bool
    var body: some View {
        ScrollView {
            MainScrollContentView(showNetworkAlert: $showNetworkAlert)
        }
    }
}

struct MainScrollContentView: View {
    @EnvironmentObject var categoryParser: CategoryParser
    @Binding var showNetworkAlert: Bool
    var body: some View {
        if categoryParser.isUpdating {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        ProgressView()
                        if showNetworkAlert {
                            Text("Check your network connection to update the schedule.")
                                .multilineTextAlignment(.center)
                                .font(.caption2)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        } else {
            VStack {
                SportChips()
                    .padding(.vertical, 10)
                EventList()
                LoadMoreEventsButton()
                    .padding(.top, 10)
                    .padding(.bottom, 30)
            }
        }
    }
}

struct LoadMoreEventsButton: View {
    @EnvironmentObject var categoryParser: CategoryParser
    var body: some View {
        HStack {
            if !categoryParser.isEventsExpandedToMax && categoryParser.events.count > 0 && categoryParser.groupedEvents.days.count == 14 {
                Spacer()
                Button(action: {
                    categoryParser.updateDisplayEvents(maxDays: nil)
                }) {
                    VStack {
                        Text("Load More Events...")
                        Text("Schedule Version: \(UserDefaults.standard.string(forKey: "version.txt") ?? "Unknown")")
                            .font(.caption2)
                    }
                }
                Spacer()
            }
        }
    }
}


