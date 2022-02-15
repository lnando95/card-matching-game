
//
// MemoryGameView.swift
// Matching Game
//
// Created by Kevin Gonzalez on 2/8/22.
//
import SwiftUI
struct MemoryGameView: View {
    @ObservedObject var memoryGame: MemoryGame
    @State private var gameHasEnded = false
//    @State private var degrees = 0.0
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: [GridItem(),GridItem(), GridItem(), GridItem()]) {
                ForEach(memoryGame.cards) { card in
                    CardView(card: card, memoryGame: memoryGame).onTapGesture {
                        
                            memoryGame.model.flipCard(card: card)
                            memoryGame.objectWillChange.send()
                        
                        if memoryGame.model.matches.count == 16 {
                            gameHasEnded = true
                        }
                    }.alert(isPresented: $gameHasEnded) {
                        Alert(title: Text("You've Won"), message: Text("Good Job"), dismissButton: .cancel())
                    }
//                    .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                }
                .aspectRatio(3/5, contentMode: .fit)
            }
            .padding()
        }
    }
}
struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(memoryGame: MemoryGame(gameOption: GameOption.emojiOption))
    }
}



