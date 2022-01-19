//
//  FlagGame.swift
//  Matching Game
//
//  Created by Luis Mosqueda on 1/18/22.
//

import SwiftUI

struct FlagGame: View {
    
    @State private var someAffect = 1
    
    var emojis = ["🇯🇵","🇺🇸","🇬🇧","🇧🇷","🏴󠁧󠁢󠁥󠁮󠁧󠁿","🇨🇮","🇯🇲","🇲🇨","🇵🇭","🇳🇱","🇺🇾","🇪🇸","🇻🇪","🏴󠁧󠁢󠁷󠁬󠁳󠁿","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇸🇪"]
    
    
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
            ForEach(emojis, id: \.self) { emoji in
                MatchingCards(content: emoji).aspectRatio(1/2, contentMode: .fit)
            }
            
        }
     
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
}



struct MatchingCards: View {
    var content : String
   @State var facingUp: Bool = false
    
    var body: some View {
        ZStack {
            let rectangle =  RoundedRectangle(cornerRadius: 20)
            
            
            if facingUp {
                rectangle.fill().foregroundColor(.white)
                    
                rectangle.stroke(lineWidth: 3)
                Text(content).font(Font.largeTitle)
        } else {
            rectangle.fill()
            }
        }
        .onTapGesture {
            facingUp = !facingUp
            
        }
    }
}

struct FlagGame_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
