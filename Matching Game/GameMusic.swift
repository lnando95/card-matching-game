//
//  GameMusic.swift
//  Matching Game
//
//  Created by Sam Hiatt  on 2/16/22.
//

import AVFoundation
import AVKit
var audioPlayer: AVAudioPlayer?
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could Not find Sound File")
        }
    }
}
