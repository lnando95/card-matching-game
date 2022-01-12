//
//  CardGameView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/11/22.
//

import SwiftUI

struct CardGameView: View {
    
    var grid: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var cardGameData: [Card] = emojiCards
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: grid) {
                ForEach((cardGameData), id: \.self) { emojiButton in
                    Button("\(emojiButton.image)") {
                        
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
        CardGameView()
    }
}
