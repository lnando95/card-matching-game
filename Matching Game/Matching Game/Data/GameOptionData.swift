//
//  GameOptionData.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/11/22.
//

import Foundation

extension GameOption {
    static let emojiOption =  GameOption(id: 2000, cards: emojiCards, category: "Emojis")
    static let animalOption = GameOption(id: 2001, cards: animalCards, category: "Animals")
    static let sportOption = GameOption(id: 2002, cards: sportCards, category: "sports")
    
    static let allOptions = [emojiOption, animalOption, sportOption]
}
