
//
// MemoryGameView.swift
// Matching Game
//
// Created by Kevin Gonzalez on 2/8/22.
//
import SwiftUI
struct MemoryGameView: View {
    @State private var animationAmount = 0.0
    @State private var isFaceUp = false
    @ObservedObject var memoryGame: MemoryGame
    var body: some View {
        ZStack {
            LazyVGrid(columns: [GridItem(),GridItem(), GridItem(), GridItem()]) {
                ForEach(memoryGame.cards) { card in
                    CardView(card: card, memoryGame: memoryGame).onTapGesture {
                       
                    }
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



