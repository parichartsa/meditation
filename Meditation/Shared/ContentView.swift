import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    var body : some View{
        MeditationView()
            .environmentObject(audioManager)
    }
}

#Preview {
    ContentView()
        .environmentObject(AudioManager())
}
