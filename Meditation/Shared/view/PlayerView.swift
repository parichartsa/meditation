import SwiftUI

struct PlayerView: View {
    
    @State private var value: Double = 0.0
    @EnvironmentObject var audioManager: AudioManager
    
    var isPreview: Bool = false
    var body : some View {
        ZStack{
            Image("music")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                HStack {
                    Button{
                        
                    } label: {
                        Image(systemName: "heart")
                            .foregroundColor(.white)
                            .padding()
                            .background(.white.opacity(0.5))
                            .clipShape(Circle())
                    }
                    Button{
                                
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundColor(.white)
                            .padding()
                            .background(.white.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                                                
                Spacer()
                                                
                Text("Night Island")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                                                
                Text("Sleep Music".uppercased())
                    .opacity(0.5)
            }
                                                
            HStack(spacing: 20) {
                Button {
                    audioManager.player?.currentTime -= 15
                                            
                } label: {
                    Image(systemName: "gobackward.15")
                        .font(.title)
                }
                Button {
                    audioManager.playPause()
                                            
                } label: {
                    Image(systemName: audioManager.player?.isPlaying ?? false ? "pause.fill" : "play.fill")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(.white)
                        .clipShape(Circle())
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Circle())
                }
                                        
                Button {
                    audioManager.player?.currentTime += 15
                                            
                } label: {
                    Image(systemName: "goforward.15")
                        .font(.title)
                }
            }
                                                
            VStack (spacing: 5, content: {
                Slider(value: $value, in:0...Double(audioManager.player?.duration ?? 0))
                    { editing in
                        print("editing", editing)
                        
                        if !editing {
                            audioManager.player?.currentTime = value
                        }
                    })
                    .accentColor(.white)
            })
                                                
            HStack {
                Text("\(DataComponentsFormatter.positional.string(from: Double(audioManager.player?.currentTime ?? 0)) ?? "0:00")")
                                        
                Spacer()
                                        
                Text("\(DataComponentsFormatter.positional.string(from: Double(audioManager.player?.duration ?? 0)) ?? "0:00")")
            }
                                                
            Spacer()
            .frame(height: UIScreen.main.bounds.height / 13)
        }
        .foregroundColor(.white)
        .padding(20)
        .onAppear() {
            //here we call audio manager so we need to import track
            audioManager.shared.startPlayer(track: "music", isPreview: isPreview)

        }
    }
}

#Preview {
    PlayerView(isPreview:true)
        .environmentObject(AudioManager())
}

