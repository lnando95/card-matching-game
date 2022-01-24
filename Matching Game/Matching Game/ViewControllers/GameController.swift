//
//  GameController.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/19/22.
//

import Foundation
import SwiftUI

struct MemoryGame {
    
    private var model: CardGame<String> = MemoryGame.createMemoryGame()
    
    
    static func createMemoryGame () -> CardGame<String> {
      let emojis = ["🦄","🦁","😫","😋","🙂","🧐","🐥","🥶"]
        
        let numberOfPairs = 8
        
        return CardGame<String>(numberOfPairsofCards: numberOfPairs) {
            pair in emojis[pair]
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

