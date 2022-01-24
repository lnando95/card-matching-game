//
//  MainCardView.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/20/22.
//

import SwiftUI

struct MainCardView: View {
    @State private var timer = StopWatchManager()
    @State private var animationAmount = 0.0
    @State private var score = 0
    var grid: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    var gameOption: GameOption
    var memoryGame: MemoryGame
    
    var body: some View {
        ScrollView {
            
            let time = timer.secondsElapsed
            let currenTime = time.formatted(.number)
            
            Text("Time: \(currenTime)")
                .font(.system(size: 30))
                .padding(8)
                .background(.red)
                .clipShape(Capsule())
                .padding()
                .padding(.top, -28)

            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                ForEach(memoryGame.cards) {card
                    in CardView(card: card, numberOfPairs: self.memoryGame.pairs) .aspectRatio(3/5, contentMode: .fit)
                }
            }
            
        }
        VStack {
            Text("Score: \(score)")
            
                .padding()
                .font(.largeTitle)
                .background(.red)
                .cornerRadius(20)
            
        }
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView(gameOption: GameOption.emojiOption, memoryGame: MemoryGame(gameOption: GameOption.allOptions.first!))
    }
}
