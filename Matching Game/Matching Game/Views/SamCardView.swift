//
//  CardGameView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/11/22.
//

import SwiftUI
struct SamCardGameView: View {
    @Environment(\.dismiss) var dismiss
    @State private var animationAmount = 0.0
    @State private var score = 0
    @State private var cardsFlipped = 0
    @State private var timerView = TimerView()
    @State private var pauseAlertShowing = false
    @State private var homeAlertShowing = false
    @State private var gamesStarted = false
    @State private var buttonText = "Start Game"
    
    var grid: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    var gameOption: GameOption
    var memoryGame: MemoryGame
    
    var body: some View {
        ScrollView {
            HStack(spacing: 30) {
                Text("Score: \(score)")
                    .padding(10)
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .background(.blue)
                    .cornerRadius(20)
                Button("Home") {
                    homeAlertShowing = true
                }
                .foregroundColor(.black)
                .padding(10)
                .font(.system(size: 25))
                .padding(.trailing, 15)
                .padding(.leading, 15)
                .background(.blue)
                .cornerRadius(20)
                .alert(isPresented: $homeAlertShowing) {
                    Alert(
                        title: Text("Are you sure to want to Quit your current Game, your progress will not be saved"),
                        primaryButton: .cancel(Text("Continue Game")) {
                            homeAlertShowing = false
                        },
                        secondaryButton: .destructive(Text("Quit Game")) {
                            dismiss()
                        }
                    )
                }
            }
            
            MemoryGameView(memoryGame: memoryGame)
            .onTapGesture(count: 1) {
                cardsFlipped += 1
                
                withAnimation {
                    checkAnimation()
                }
            }
            timerView
                .onTapGesture {
                    gamesStarted = true
                }
        }
        .background(.yellow)
        .navigationTitle("Game")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: Functions
    
    func checkAnimation() {
        if cardsFlipped == 2 {
            cardsFlipped = 0
        }
    }
    
    
    struct TimerView_Previews: PreviewProvider {
        static var previews: some View {
            SamCardGameView(gameOption: GameOption.sportOption, memoryGame: MemoryGame(gameOption: GameOption.allOptions.first!))
        }
    }
}





