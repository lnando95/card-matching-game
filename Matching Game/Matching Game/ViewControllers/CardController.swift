import Foundation
import SwiftUI
// step 1. remove isFlip from card
// step 2. instead of isFlip reference cardGame.matches and cardGame firstFaceupCard and secondFaceUpCard
class CardGame: ObservableObject {
  var cards: [Card]
  @Published var matches: [Card] = []
  @Published var firstFaceUpCard: Card?
  @Published var secondFaceUpCard: Card?
  @Published var numberOfGuesses = 0
  @Published var didWin = false
  @Published var isNewGame = true
  var numberOfPairs = 0
  var emojiMaker: (Int) -> String
  func flipCard(card: Card) {
    isNewGame = false
    numberOfGuesses += 1
      playSound(sound: "flipcard", type: "mp3")
    if firstFaceUpCard != nil && secondFaceUpCard != nil {
      // this is the third card tapped, unlflips the first two cards.
      firstFaceUpCard = nil
      secondFaceUpCard = nil
    }
    // this function will handle flipping the card and unflipping after a second
    if firstFaceUpCard == nil {
      firstFaceUpCard = card
    } else {
      secondFaceUpCard = card
    }
    self.updateMatches()
  }
  func cardIsFlipped(card: Card) -> Bool {
    return matches.contains { currentCard in
      card.id == currentCard.id
    } || firstFaceUpCard?.id == card.id || secondFaceUpCard?.id == card.id
  }
  func updateMatches() {
    guard let firstFaceUpCard = firstFaceUpCard, let secondFaceUpCard = secondFaceUpCard else {return}
    // this is the second card guess, verify if its a match or not
    if firstFaceUpCard.image == secondFaceUpCard.image {
      // it's a match
        playSound(sound: "correct", type: "mp3")
      matches.append(firstFaceUpCard)
      matches.append(secondFaceUpCard)
    }
    if matches.count == cards.count {
      //they won the game
      didWin = true
        playSound(sound: "won", type: "mp3")
    }
    //  // if it's not a match, do nothing
    //  self.firstFaceUpCard = nil
    //  self.secondFaceUpCard = nil
  }
  init(numberOfPairsofCards: Int, createdContent: @escaping (Int) -> String) {
    cards = []
    self.emojiMaker = createdContent
    self.numberOfPairs = numberOfPairsofCards
    self.startGame()
  }
  func resetGame() {
    matches = []
    cards = []
    numberOfGuesses = 0
    firstFaceUpCard = nil
    secondFaceUpCard = nil
    startGame()
  }
  func startGame() {
    for pairIndex in 0..<numberOfPairs {
      let emoji = emojiMaker(pairIndex)
      cards.append(Card(image: emoji, id: pairIndex * 2 ))
      cards.append(Card(image: emoji, id: pairIndex * 2 + 1))
    }
    cards.shuffle()
    didWin = false
    isNewGame = true
  }
}
