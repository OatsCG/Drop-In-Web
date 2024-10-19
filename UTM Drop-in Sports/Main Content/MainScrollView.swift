//
//  MainScrollView.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct MainScrollView: View {
    @EnvironmentObject var categoryParser: CategoryParser
    @Binding var showNetworkAlert: Bool
    
    var body: some View {
        ScrollView {
            MainScrollContentView(showNetworkAlert: $showNetworkAlert)
        }
    }
}
