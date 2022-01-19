//
//  CardGameView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/11/22.
//

import SwiftUI





struct SamCardGameView: View {
    @State private var timer = StopWatchManager()
    @State private var animationAmount = 0.0
     
    var grid: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    var gameOption: GameOption
    
    var body: some View {
        ScrollView {
            
            let time = timer.secondsElapsed
            let currenTime = time.formatted(.number)
            
            Text("\(currenTime)")
                .font(.system(size: 30))
                .padding(8)
                .background(.red)
                .clipShape(Capsule())
                .padding()
                .padding(.top, -28)
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                ForEach(gameOption.cards, id: \.self) { emojiButton in
                    MatchingCard(content: emojiButton.image).aspectRatio(3/5, contentMode: .fit)
                }
            }
        }
    }
    
    struct MatchingCard: View {
        @State private var animationAmount  = 180.0
        @State var facingUp: Bool = false
        var content : String
        var body: some View {
            ZStack {
                let rectangle = RoundedRectangle(cornerRadius: 20)
                if facingUp {
                    rectangle.fill().foregroundColor(.white)
                    rectangle.stroke(lineWidth: 10).foregroundColor(.red)
                   
                Text(content).font(Font.largeTitle)
                        
                } else {
                    rectangle.fill(.red)
                }
            }
            .onTapGesture {
                facingUp = !facingUp
                withAnimation {
                    flipCard()
                }
                
            }
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 2, z: 0))
        }
        
        func flipCard() {
            if facingUp == true {
                animationAmount -= 180
            } else {
                animationAmount += 180
            }
        }
    }
    
    struct SamCardGameView_Previews: PreviewProvider {
        static var previews: some View {
            CardGameView(gameOption: emojiOption)
        }
    }
}

