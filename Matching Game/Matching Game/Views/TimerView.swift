
//  TimerView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/20/22.
import SwiftUI

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    @State var isTimerRunning = false
    @State private var startTime: Double = 0.00
    @State private var currentTime = ""
    @State private var timerString = "0.00"
    @State private var timerPublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var pauseAlertShowing = false
    @State private var gameStarted = false
    @State private var buttonText = "Start Game"
    
    var memoryGame: MemoryGame
    
    var body: some View {
       
        HStack {
            Button(buttonText) {
               gameStarted = true
                timerControls3()
                toggleAlert()
            }
            .padding(15)
            .foregroundColor(.black)
            .font(.system(size: 25))
            .background(.yellow)
            .cornerRadius(20)
            .padding(.leading, 10)
            
            Spacer()
            
            Text(self.timerString)
                .font(Font.system(.largeTitle, design: .monospaced))
                .onReceive(timerPublisher) { _ in
                    startTime += 0.01
                        timerString = String(format: "%.1f", startTime)
                }
                .alert(isPresented: $pauseAlertShowing) {
                    Alert(
                        title: Text("Game Paused"),
                        primaryButton: .cancel(Text("Continue Game")) {
                            pauseAlertShowing = false
                            timerControls3()
                            
                        },
                        secondaryButton: .destructive(Text("Quit Game")) {
                            dismiss()
                        }
                    )
                }
                .padding(10)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .padding(.trailing, 15)
                .padding(.leading, 15)
                .background(.yellow)
                .cornerRadius(20)
                .padding(.trailing, 10)
            
                .onAppear() {
                    self.stopTimer()
                }
        }
    }
    
    func toggleAlert() {
        if let timeString = Double(timerString) {
            if  timeString > 0.1 {
                pauseAlertShowing = true
            }
        }
    }
    func timerControls3() {
         if isTimerRunning {
             self.stopTimer()
            // self.startTime = startTime
         } else {
             self.startTimer()
         }
         isTimerRunning.toggle()
     }
    
   func timerControls() {
        if isTimerRunning {
            
            self.stopTimer()
        } else {
            self.startTimer()
        }
        isTimerRunning.toggle()
    }
    
   
    
    func stopTimer() {
        self.timerPublisher.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timerPublisher = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(memoryGame: MemoryGame.init(gameOption: GameOption.animalOption))
    }
}


