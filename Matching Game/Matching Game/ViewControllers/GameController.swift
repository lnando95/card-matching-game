//
//  GameController.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/19/22.
//

import Foundation
import SwiftUI

struct MemoryGame {
    
    private var model: CardGame
    
    init(gameOption: GameOption) {
        model = Self.createMemoryGame(gameOption: gameOption)
    }
    
    
    static func createMemoryGame(gameOption: GameOption) -> CardGame {
        return CardGame(numberOfPairsofCards: gameOption.cards.count) {
            pair in
            guard gameOption.cards.count > pair else {
                // "pair" is out of bounds from cards array (example: cards array has 4 items and "pair" == 6
                fatalError()
                return "🤬"
            }
            return gameOption.cards[pair].image
        }
    }
       var cards: [Card] {
            model.cards
        }
        var pairs:Int {
            model.numberOfPairs
        }
    func choose(card: Card) {
        model.choosedCard(card: card)
    }
    }

