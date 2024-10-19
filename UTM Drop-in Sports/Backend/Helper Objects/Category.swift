//
//  Category.swift
//  UTM Drop-in Sports
//
//  Created by Charlie Giannis on 2024-10-19.
//

import SwiftUI

class Category: Decodable, Hashable, ObservableObject {
    var id: UUID = UUID()
    let title: String
    let symbol: String
    @Published var selected: Bool = false
    @Published var shown: Bool = false
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        symbol = try values.decode(String.self, forKey: .symbol)
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case symbol
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
