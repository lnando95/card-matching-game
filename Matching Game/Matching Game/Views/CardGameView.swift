//
//  CardGameView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/11/22.
//

import SwiftUI
struct SamCardGameView: View {
    
    @State private var timerView = TimerView2(memoryGame: .init(gameOption: .animalOption))
    @ObservedObject var memoryGame: MemoryGame
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                Text("Guesses \(memoryGame.model.numberOfGuesses)")
                    .font(.subheadline)
                    .padding()
                    .background(.yellow)
                     .cornerRadius(20)
                     .padding(.trailing, 20)
            }
            MemoryGameView(memoryGame: memoryGame)
                timerView
                .padding(.bottom)
        
        .onAppear(perform: {
            audioPlayer?.stop()
        })
        
    }
        .background(.black)
        .navigationTitle("Game")
        .navigationBarTitleDisplayMode(.inline)

    
    }
    

}
    struct SamCardGameView_Previews: PreviewProvider {
        static var previews: some View {
            SamCardGameView(memoryGame: MemoryGame(gameOption: GameOption.allOptions.first!))
            
        }
    }






