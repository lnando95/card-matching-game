//
//  GameOption.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/11/22.
//

import Foundation

struct GameOption: Hashable, Identifiable {
    var id: Int
    var cards: [Card]
    var category: String
}
