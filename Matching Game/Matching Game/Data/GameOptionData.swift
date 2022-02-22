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
    static let sportOption = GameOption(id: 2002, cards: sportCards, category: "Sports")
    static let foodOption = GameOption(id: 2003, cards: foodCards, category: "Foods")
      static let flagOption = GameOption(id: 2004, cards: flagCards, category: "Flags")
      static let instrumentOption = GameOption(id: 2005, cards: instrumentCards, category: "Instruments")
    static let allOptions = [emojiOption, animalOption, sportOption, foodOption, flagOption, instrumentOption]
}
