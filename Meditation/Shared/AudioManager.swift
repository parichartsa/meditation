import SwiftUI
import AVKit

final class AudioManager: ObservableObject {
     
    //static let shared = AudioManager()
    
    var player: AVAudioPlayer?
    
    func startPlayer(track: String, isPreview: Bool =  false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resourse not found: \(track)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
            }
            player?.play()
        } catch{
            print("Failto initialize player", error)
        }
    }
    func playPause() {
        guard let player = player else {
            print("instance of audio player not found")
            return
        }
        
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
}
