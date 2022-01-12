//
//  GameOptionData.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/11/22.
//

import Foundation


let emojiOption =  GameOption(id: 2000, cards: emojiCards, category: "Emojis")
let animalOption = GameOption(id: 2001, cards: animalCards, category: "Animals")
let sportOption = GameOption(id: 2002, cards: sportCards, category: "sports")
   
let allOptions = [emojiOption, animalOption, sportOption]
