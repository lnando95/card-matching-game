//
//  CardGameView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/11/22.
//

import SwiftUI

struct CardGameView: View {
    var grid: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    var gameOption: GameOption
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: grid) {
            ForEach((gameOption.cards), id: \.self) { emojiCards in
                Button(emojiCards.image) {
                    
                }
                    .padding()
                    
                }
                .padding()
            }
            
            .font(.largeTitle)
        }
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView(gameOption: emojiOption)
    }
}
