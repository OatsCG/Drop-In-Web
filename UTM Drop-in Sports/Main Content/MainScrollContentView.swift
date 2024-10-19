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
