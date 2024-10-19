//
//  Event.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

class Event: Decodable, Hashable {
    var relativeTimeDate: RelativeTimeDate
    var id: Int
    let url: String
    let title: String
    let description: String
    let image: String
    let start_date: String
    let end_date: String
    let venue: String
    let ticket_label: String
    let ticket_url: String
    let sortCategory: String
    let symbol: String
    let womens: Bool
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        url = try values.decode(String.self, forKey: .url)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        image = try values.decode(String.self, forKey: .image)
        start_date = try values.decode(String.self, forKey: .start_date)
        end_date = try values.decode(String.self, forKey: .end_date)
        venue = try values.decode(String.self, forKey: .venue)
        ticket_label = try values.decode(String.self, forKey: .ticket_label)
        ticket_url = try values.decode(String.self, forKey: .ticket_url)
        sortCategory = try values.decode(String.self, forKey: .sortCategory)
        symbol = try values.decode(String.self, forKey: .symbol)
        womens = try values.decode(Bool.self, forKey: .womens)
        relativeTimeDate = formatDateRange(startDate: start_date, endDate: end_date)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case title
        case description
        case image
        case start_date
        case end_date
        case venue
        case ticket_label
        case ticket_url
        case sortCategory
        case symbol
        case womens
    }
    
    static func ==(lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
