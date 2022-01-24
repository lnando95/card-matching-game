//
//  CardController.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/19/22.
//

import Foundation

struct CardGame {
    
    var cards: [Card]
    var matchedCards = [Card]()
    var flippedCard1: Card?
    var flippedCard2: Card?

    var numberOfPairs: Int
    
//    func cardIsMatched(_ card: Card) -> Bool {
//        matchedCards.contains(card)
//    }
    
    func choosedCard(card:Card) {
        
    }
    
    init(numberOfPairsofCards: Int, createdContent: (Int) -> String) {
        cards = []
        numberOfPairs = numberOfPairsofCards
        
        for pairIndex in 0..<numberOfPairsofCards {
            let image = createdContent(pairIndex)
            
            cards.append(Card(image: image))
            cards.append(Card(image: image))
        }
        cards.shuffle()
    }
}
