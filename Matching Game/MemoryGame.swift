
//
// MemoryGameView.swift
// Matching Game
//
// Created by Kevin Gonzalez on 2/8/22.
//
import SwiftUI
struct MemoryGameView: View {
    @ObservedObject var memoryGame: MemoryGame
    var body: some View {
        ZStack {
            LazyVGrid(columns: [GridItem(),GridItem(), GridItem(), GridItem()]) {
                ForEach(memoryGame.cards) { card in
                    CardView(card: card, memoryGame: memoryGame).onTapGesture {
                        memoryGame.model.flipCard(card: card)
                        memoryGame.objectWillChange.send()
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



