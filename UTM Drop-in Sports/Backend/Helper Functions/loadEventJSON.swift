//
//  loadEventJSON.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-09-08.
//

import SwiftUI

func loadEventJSON() -> EventJSON? {
    let fileManager: FileManager = FileManager.default
    if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        let eventsFileURL: URL = documentsDirectory.appendingPathComponent("events.json")
        do {
            let data: Data = try Data(contentsOf: eventsFileURL)
            let decoder: JSONDecoder = JSONDecoder()
            let eventJSON: EventJSON = try decoder.decode(EventJSON.self, from: data)
            return eventJSON
        } catch {
            print("Error loading or decoding events.json: \(error)")
        }
    }
    return nil
}


