//
//  SecondContentView.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 2/16/22.
//

import SwiftUI

struct SecondContentView: View {
    let universalSize = UIScreen.main.bounds
    
    @State var isAnimated = false
    var body: some View {
        
        ZStack {
            getSinWave(interval: universalSize.width, amplitude: 200, baseline: -50 + universalSize.height/2)
                .foregroundColor(Color.yellow).opacity(0.4)
                .offset(x: isAnimated ? -1*universalSize.width : 0)
            .animation(
                Animation.linear(duration: 12)
                .repeatForever(autoreverses: false)
            )
            getSinWave(interval: universalSize.width*1.2, amplitude: 150, baseline: 50 + universalSize.height/2)
                .foregroundColor(Color.yellow).opacity(0.4)
                .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
            .animation(
                Animation.linear(duration: 16)
                .repeatForever(autoreverses: false)
            )
        }.onAppear(){
            self.isAnimated = true
                
        }.background(.clear)
            
    }
    
    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            
        }
    
    }
}

struct SecondContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondContentView()
    }
}
