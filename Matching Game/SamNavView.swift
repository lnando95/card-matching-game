import SwiftUI

struct SamNavView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List(GameOption.allOptions) {
                        options in
                        NavigationLink {
                            SamCardGameView(gameOption: options, memoryGame: MemoryGame(gameOption: options))
                        } label: {
                            Text(options.category)
                                .font(.system(size: 24))
                                
                                
                        }.listRowBackground(Color.blue)
                    }
                    // Ignore safe area to take up whole screen
                    .background(Color.yellow.ignoresSafeArea())
                    .onAppear {
                        // Set the default to clear
                        UITableView.appearance().backgroundColor = .clear
                    }
                
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
                    }.background(.yellow)
                }
            }.background(.yellow)
        }
    }
}
struct SamNavView_Previews: PreviewProvider {
    static var previews: some View {
        SamNavView()
    }
}
