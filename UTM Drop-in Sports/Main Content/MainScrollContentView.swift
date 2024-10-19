//
//  MainScrollContentView.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct MainScrollContentView: View {
    @EnvironmentObject var categoryParser: CategoryParser
    @Binding var showNetworkAlert: Bool
    
    var body: some View {
        if categoryParser.isUpdating {
            MainScrollLoading(showNetworkAlert: $showNetworkAlert)
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
