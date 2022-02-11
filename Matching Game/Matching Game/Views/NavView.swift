//
//  NavView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/7/22.
//

import SwiftUI

struct NavView: View {
    var body: some View {
       
        NavigationView {
            ZStack {
                List(GameOption.allOptions) {
                options in
                NavigationLink {
                    SamCardGameView(gameOption: options, memoryGame: MemoryGame(gameOption: options))
                } label: {
                    Text(options.category)
                        .font(.system(size: 24))
                }
            }
            .navigationTitle("Games")
            VStack {
            
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink("\(Image(systemName: "star.fill"))") {
                        StatsView(memoryGame: MemoryGame(gameOption: GameOption.emojiOption))
                    }
                    .font(.system(size: 30))
                    .padding(15)
                    .background(.blue)
                    .clipShape(Circle())
                    .foregroundColor(.black)
                    .padding(.trailing,25)
                    
                }
                
            }
        }
        
            
            
        }
    }
        
    }
struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
