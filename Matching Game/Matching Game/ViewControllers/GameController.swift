import Foundation
import SwiftUI
class MemoryGame: ObservableObject {
  @ObservedObject var model: CardGame
  init(gameOption: GameOption) {
    model = Self.createMemoryGame(gameOption: gameOption)
  }
  static func createMemoryGame(gameOption: GameOption) -> CardGame {
    return CardGame(numberOfPairsofCards: gameOption.cards.count) {
      pair in
      guard gameOption.cards.count > pair else {
        // "pair" is out of bounds from cards array (example: cards array has 4 items and "pair" == 6
        fatalError()
        return "ur 💩"
      }
      return gameOption.cards[pair].image
    }
  }
  var cards: [Card] {
    model.cards
  }
  func choose( card: Card) {
    model.flipCard(card: card)
  }
}
