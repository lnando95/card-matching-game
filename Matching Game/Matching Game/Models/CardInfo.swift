//
//  CardInfo.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/11/22.
//

import Foundation

struct Card: Hashable, Identifiable {
    var image: String
    let id = UUID()
    // TODO: move isFaceUp and isMatched concept to the viewModel/CardGame object
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
}
