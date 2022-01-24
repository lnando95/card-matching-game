//
//  CardController.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/19/22.
//

import Foundation

struct CardGame<CardContent> {
    
    var cards: Array<Card>
    var numberOfPairs: Int
    
    func choosedCard(card:Card) {
        
    }
    
    init(numberOfPairsofCards: Int, createdContent: (Int) -> CardContent) {
        cards = []
        numberOfPairs = numberOfPairsofCards
        
        for pairIndex in 0..<numberOfPairsofCards {
            let image = createdContent(pairIndex)
            
            cards.append(Card(image: image as! String, id: pairIndex * 2))
            cards.append(Card(image: image as! String, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
}
