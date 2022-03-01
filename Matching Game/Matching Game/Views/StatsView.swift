import SwiftUI


//struct HighestScore: View {
//    var body: some View {
//    Text("Highest score goes here")
//      .foregroundColor(Color.blue)
//  }
//}
//struct RecentGames: View {
//  var body: some View {
//    Text("Most Recent Games")
//      .foregroundColor(Color.blue)
//  }
//}

struct StatsContentView: View {
    @Environment(\.dismiss) var dismiss
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(.black))]
    }
    var body: some View {
        
        NavigationView {
            VStack {

                List {
                    Section(header: Text("Highest Score")
                                .font(.title)
                                .foregroundColor(Color.yellow)) {
                        Text("Game: Emoji, Time: 1:23, Won")
                        Text("Game: Sports, Time: 00:59, Won")
                        Text("Game: Sports, Time: 1:14, Won" )
                        Text("Game: Sports, Time: 00:40, Quit")
                        Text("Game: Sports, Time: 00:48, Won")
                    }
                    Section(header: Text("Recent Scores")
                                .font(.title)
                                .foregroundColor(Color.yellow)) {
                        Text("Game: Sports, Time: 00:34, Won")
                        Text("Game: Sports, Time: 1:34, Quit")
                        Text("Game: Sports, Time: 2:01, Won")
                        Text("Game: Sports, Time: 00:38, Quit")
                        Text("Game: Sports, Time: 00:59, Quit")
                        
                        RoundedRectangle(cornerRadius: 25)
                            .onTapGesture {
                                dismiss()
                            }
                            .foregroundColor(Color.yellow)
                            .frame(height: 40)
                            .overlay(Text("Return"))
                            .navigationTitle("Scores(Still In Progress)")
                    }
                                .toolbar {
                                    EditButton()
                                }
            
                }
            }
        }
    }
}
struct StatsContentView_Previews: PreviewProvider {
    static var previews: some View {
        StatsContentView()
    }
}
