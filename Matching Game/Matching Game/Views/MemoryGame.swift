import SwiftUI
struct MemoryGameView: View {
    @Environment(\.dismiss) var dismiss

  @ObservedObject var memoryGame: MemoryGame
  @State private var gameHasEnded = false
  var body: some View {
    ZStack {
      LazyVGrid(columns: [GridItem(),GridItem(), GridItem(), GridItem()]) {
        ForEach(memoryGame.cards) { card in
          CardView(card: card, memoryGame: memoryGame).onTapGesture {
            memoryGame.model.flipCard(card: card)
            memoryGame.objectWillChange.send()
          }
        }
        .aspectRatio(5/7, contentMode: .fit)
      }.onReceive(memoryGame.model.$isNewGame) { newValue in
        ForEach(memoryGame.cards) { card in
          CardView(card: card, memoryGame: memoryGame).onTapGesture {
            memoryGame.model.flipCard(card: card)
            memoryGame.objectWillChange.send()
          }
        }
        .aspectRatio(5/7, contentMode: .fit)
      }
      .padding()
    }
    .alert("You've Won" , isPresented: $memoryGame.model.didWin) {
        
      Button("Great") {
        memoryGame.model.resetGame()
          dismiss()
          
      }
    }
  }
}
struct MemoryGameView_Previews: PreviewProvider {
  static var previews: some View {
    MemoryGameView(memoryGame: MemoryGame(gameOption: GameOption.emojiOption))
  }
}
