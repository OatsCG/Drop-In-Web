//
//  EventImage.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-08.
//

import SwiftUI

struct EventImage: View {
    var event: Event
    // if image exists, height is always 674px
    
    var body: some View {
        if let img = URL(string: event.image) {
            AsyncImage(
                url: img,
                transaction: Transaction(animation: .default)
            ) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                default:
                    ProgressView()
                }
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    ContentView()
}
