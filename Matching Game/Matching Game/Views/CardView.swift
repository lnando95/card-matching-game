//
//  CardView.swift
//  Matching Game
//
//  Created by Kevin Gonzalez on 1/19/22.
//

import SwiftUI

struct CardView: View {
   @State private var animationAmout = 180.0
   @State var card: Card
    var numberOfPairs: Int
    
    var body: some View {
        
        ZStack{
            let rectangle = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                rectangle.fill().foregroundColor(.white)
                rectangle.stroke(lineWidth: 10).foregroundColor(.red)
                Text(card.image).font(Font.largeTitle)
            } else{
                rectangle.fill(.red)
            }
        } .onTapGesture {
            card.isFaceUp.toggle()
            withAnimation{
                flipCard()
            }
        }
        .rotation3DEffect(.degrees(animationAmout), axis: (x: 0, y: 2, z: 0))
        
    }
    
    func flipCard() {
        if card.isFaceUp == true {
            animationAmout -= 180
            } else {
            animationAmout += 180
            }
 }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card:Card(image: "🐥", id: 12), numberOfPairs: 5)
    }
}


//struct MatchingCard: View {
//    @State private var animationAmount  = 180.0
//    @State var facingUp: Bool = false
//    var content : String
//    var body: some View {
//        ZStack {
//            let rectangle = RoundedRectangle(cornerRadius: 20)
//            if facingUp {
//                rectangle.fill().foregroundColor(.white)
//                rectangle.stroke(lineWidth: 10).foregroundColor(.red)
//                // animationAmount += 180
//                Text(content).font(Font.largeTitle)
//
//            } else {
//                rectangle.fill(.red)
//            }
//        }
//        .onTapGesture {
//            facingUp = !facingUp
//
//            withAnimation {
//                flipCard()
//            }
//
//        }
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 2, z: 0))
//
//
//    }
//
//    func flipCard() {
//        if facingUp == true {
//            animationAmount -= 180
//        } else {
//            animationAmount += 180
//        }
//    }
//}
