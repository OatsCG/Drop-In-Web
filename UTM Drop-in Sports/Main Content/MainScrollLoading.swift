//
//  MainScrollLoading.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

struct MainScrollLoading: View {
    @Binding var showNetworkAlert: Bool
    
    var body: some View {
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
    }
}
