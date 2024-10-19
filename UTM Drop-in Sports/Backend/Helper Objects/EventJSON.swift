//
//  EventJSON.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import Foundation

class EventJSON: Decodable {
    let categories: [Category]
    let events: [Event]
}
