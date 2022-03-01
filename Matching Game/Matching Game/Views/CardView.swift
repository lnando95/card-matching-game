import SwiftUI
struct CardView: View {
    var card: Card
    
    @ObservedObject var memoryGame: MemoryGame
    @State private var animationAmount = 0.0
    
    @State var fillColor = Color.yellow
    let rectangle = RoundedRectangle(cornerRadius: 20.0)
    
    var body: some View {
        ZStack {
            
            rectangle.fill(fillColor)
                .onTapGesture {
                    memoryGame.model.flipCard(card: card)
                    memoryGame.objectWillChange.send()
                    withAnimation {
                        flipCard()
                    }
                }
            if memoryGame.model.cardIsFlipped(card: card) {
                Text(card.image)
                    .font(Font.largeTitle)
            }
        }
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 2, z: 0))
        .onReceive(memoryGame.model.objectWillChange) { _ in
            flipCard()
        }
        
    }
    func flipCard() {
        if memoryGame.model.cardIsFlipped(card: card) {
            animationAmount = -180
            fillColor = .white
        } else {
            animationAmount = 0
            fillColor = .yellow
        }
    }
    
    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            CardView(card: Card(image: ":expressionless:", id: 23), memoryGame: MemoryGame(gameOption: GameOption.emojiOption))
        }
    }
}





