//
//  CardGameView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/11/22.
//

import SwiftUI

struct CardGameView: View {
    
    @State private var timer = StopWatchManager()
    @State private var isShowing = false
    @State private var animationAmount = 0.0
    @State private var hasBeenFlipped = 0
   
    var grid: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    var gameOption: GameOption
    
    var body: some View {
        
        ScrollView {
            
            let time = timer.secondsElapsed
            let currentTime = time.formatted()
            Text("\(currentTime)")
                .font(.system(size: 30))
                .padding(.bottom, -30)
            
            LazyVGrid(columns: grid) {
                ForEach((gameOption.cards), id: \.self) { emojiCards in
                    Button(emojiCards.image) {
                       // _ = startTimer
                        hasBeenFlipped += 1
                        isShowing.toggle()
                        withAnimation {
                            flipCard()
                        }
                        
                    }
                    .padding()
                    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                }
                .padding()
            }
            
            .font(.largeTitle)
            
        }
    }
    func flipCard() {
        if isShowing == true {
            animationAmount -= 180
            
        } else {
            animationAmount += 180
            
            
        }
    }
     
    lazy var startTimer: Void = {
        if hasBeenFlipped == 1 {
            timer.startWatch()
        }
    }()
    
    struct CardGameView_Previews: PreviewProvider {
        static var previews: some View {
            CardGameView(gameOption: emojiOption)
        }
    }
}
