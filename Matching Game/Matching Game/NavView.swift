//
//  NavView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 1/7/22.
//

import SwiftUI

struct NavView: View {
    
    var options: [GameOption] = allOptions
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    List() {
                        ForEach((options), id: \.self) { game in
                            NavigationLink("\(game.category)") {
                                CardGameView()
                            }
                            .font(.system(size: 25))
                            
                        }
                    }
                }
                .navigationTitle("Game List")
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink("\(Image(systemName: "star.fill"))") {
                        StatsView()
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
struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
