import SwiftUI

struct SamNavView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(.yellow))]
    }
    @State private var buttonText = (Image(systemName: "speaker.wave.3.fill"))
    @State private var sound = false
    var body: some View {
        
        NavigationView {
            
            ZStack {
                VStack {
                    List(GameOption.allOptions) {
                        options in
                        NavigationLink {
                            SamCardGameView(memoryGame: MemoryGame(gameOption: options))
                        } label: {
                            Text(options.category)
                                .font(.system(size: 24))
                            
                            
                        }.listRowBackground(Color.yellow)
                        
                    }
                    .onAppear {
                        UITableView.appearance().backgroundColor = .clear
                        if sound == true {
                        playSound(sound: "jazz", type: "mp3")
                        } else if sound == false {
                            audioPlayer?.stop()
                        }
                    }
                    
                    HStack {
                        Button("\(buttonText)") {
                            changeText()
                            sound.toggle()
                        }
                        .font(.system(size: 30))
                        .padding(15)
                        .background(ContentView())
                        .clipShape(Circle())
                        .foregroundColor(.yellow)
                        .padding(.leading,25)
                        
                        Spacer()
                        NavigationLink("\(Image(systemName: "star.fill"))") {
                            StatsContentView()
                        }
                        .font(.system(size: 30))
                        .padding(15)
                        .background(.black)
                        .clipShape(Circle())
                        .foregroundColor(.yellow)
                        .padding(.trailing,25)
                    } .background(SecondContentView())
                }
            }.background(ContentView())
                .navigationTitle(Text("Games"))
            
            
            
            
        }
        
        
    }
    func changeText() {
        if sound == true {
            buttonText = (Image(systemName: "speaker.wave.3.fill"))
            audioPlayer?.play()
        } else {
            buttonText = (Image(systemName: "speaker.slash.fill"))
            audioPlayer?.stop()
        }
    }
}
struct SamNavView_Previews: PreviewProvider {
    static var previews: some View {
        SamNavView()
    }
}
