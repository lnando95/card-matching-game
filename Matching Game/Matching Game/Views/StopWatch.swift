import SwiftUI

class StopWatchManager: ObservableObject{

    @Published var secondsElapsed = 0.0

    var startTime: Date = Date()

    var timer = Timer()

    func startWatch(){
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
            let current = Date()
            let diffComponents = Calendar.current.dateComponents([.second, .nanosecond], from: self.startTime, to: current)
            let seconds = Double(diffComponents.second ?? 0) + Double(diffComponents.nanosecond ?? 0) / 1_000_000_000
            self.secondsElapsed += seconds
            self.startTime = current
        }

    }

    func pauseWatch(){
        timer.invalidate()
    }
}

struct StopWatch: View {

    @ObservedObject var stopWatchManager = StopWatchManager()

    var body: some View{
        ScrollView {
            Button("Start"){
                stopWatchManager.startWatch()
            }
            Text("\(stopWatchManager.secondsElapsed, specifier: "%.0f")")
            Button("Pause"){
                stopWatchManager.pauseWatch()
            }
        }
    }
}

struct StopWatch_Previews: PreviewProvider {
    static var previews: some View {
        StopWatch()
    }
}
