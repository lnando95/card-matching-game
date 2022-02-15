//
//  StatsView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/11/22.
//

import SwiftUI

struct StatsView: View {
    @ObservedObject  var memoryGame: MemoryGame
    
    var body: some View {
        NavigationView {
        VStack {
            Spacer()
            
            Text("Numeber Of Guesses")
                .padding(.bottom, 100)
        
            
            Text("High score")
            
            List() {
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
        }
      }
        .navigationTitle("ger")
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(memoryGame: MemoryGame(gameOption: GameOption.emojiOption))
    }
}
