//
//  MainNavigationView.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct MainNavigationView: View {
    @Binding var showNetworkAlert: Bool
    @State var path: NavigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            MainScrollView(showNetworkAlert: $showNetworkAlert)
                .navigationTitle(Text("UTM Drop-Ins"))
                .safeAreaPadding(.horizontal)
        }
    }
}
