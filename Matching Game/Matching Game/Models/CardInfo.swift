//
//  CardInfo.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/11/22.
//

import Foundation

struct Card: Hashable, Identifiable {
    var image: String
    var id: Int
    var isFaceUp: Bool = true
    var isMatched: Bool = false
}
