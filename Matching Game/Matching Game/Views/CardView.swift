import SwiftUI
 struct CardView: View {
  var card: Card
  @ObservedObject var memoryGame: MemoryGame
     @State private var degrees = 0.0
  var body: some View {
    ZStack {
  let rectangle = RoundedRectangle(cornerRadius: 20.0)
    if memoryGame.model.cardIsFlipped(card: card) {
      rectangle.fill(.white)
        Text(card.image)
        .font(Font.largeTitle)
    } else {
      rectangle.fill(.blue)
    }
  }
  }
  struct CardView_Previews: PreviewProvider {
    static var previews: some View {
      CardView(card: Card(image: ":expressionless:", id: 23), memoryGame: MemoryGame(gameOption: GameOption.emojiOption))
    }
  }
}




