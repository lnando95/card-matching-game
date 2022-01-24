//
//  CardGameView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/11/22.
//
 
import SwiftUI
struct SamCardGameView: View {
    @State private var timing = Timer()
    @State private var animationAmount = 0.0
    @State private var score = 0
    @State private var timer = StopWatchManager()
    @State private var hasBeenFlipped = false
    @State private var timerView = TimerView()
    @State private var buttonText = "Start Game"
    @State private var gamesStarted = false
    var grid: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    var gameOption: GameOption
    
    var timeText: String {
       return ""
    }
    
   
    var body: some View {
        
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                ForEach(gameOption.cards, id: \.self) { emojiButton in
                    MatchingCard(content: emojiButton.image).aspectRatio(3/5, contentMode: .fit)
                    
                }
                .onTapGesture {
                  hasBeenFlipped = true
                    timerView.timerControls()
                }
            }
            
            HStack(spacing: 30) {
                
                Text("Score: \(score)")
                
                    .padding()
                    .font(.largeTitle)
                    .padding(.trailing, 15)
                    .padding(.leading, 15)
                    .background(.red)
                    .cornerRadius(20)
                    
                Button("\(buttonText)") {
                    gamesStarted = true
                    changeText()
                    timerView.startTimer()
                }
                    .padding()
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .background(.red)
                    .cornerRadius(20)
            }
        
    }
    func changeText() {
        if gamesStarted {
            buttonText = "Pause Game"
        } else {
            buttonText = "Start Game"
        }
    }
      
    
    func startTheTime() {
        if hasBeenFlipped == true {
            timer.startWatch()
        }
    }
struct MatchingCard: View {
        @State public var timer = StopWatchManager()
        @State private var animationAmount  = 0.0
        @State var facingUp: Bool = false
        
        var content : String
        var body: some View {
            ZStack {
                
                let rectangle = RoundedRectangle(cornerRadius: 20)
                if facingUp {
                    
                    rectangle.fill().foregroundColor(.white)
                    rectangle.stroke(lineWidth: 10).foregroundColor(.red)
                    // animationAmount += 180
                    Text(content).font(Font.largeTitle)
                    
                } else {
                    rectangle.fill(.red)
                }
            }
            .onTapGesture {
                
                withAnimation {
                    flipCard()
                    
                }
                
                facingUp = !facingUp
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
    
    
    
    
    struct TimerView_Previews: PreviewProvider {
        static var previews: some View {
            SamCardGameView(gameOption: emojiOption)
        }
    }
}
