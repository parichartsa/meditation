import SwiftUI

struct MeditationView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    @State private var showPlayer = false
    
    var body: some View {
        VStack(spacing: 0) {
            Image("main")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack {
                Color(red: 24/255, green: 23/255, blue: 22/255)
                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .center, spacing: 8) {
                        Text("Music")
                        Text("0s")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text("Night Island")
                        .font(.title)
                    
                    Text("Ease the mind into a restful night’s sleep  with these deep, ambient tones.")
                    
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "heart.fill")
                        Text("20k liked")
                        
                        Image(systemName: "airpods")
                        Text("30k listening")
                    }
                    .font(.caption)
                    
                    Divider()
                    
                    Text("Related")
                        .font(.title3)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(demoRelated) { item in
                                VStack(alignment: .leading, spacing: 10) {
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 180, height: 180)
                                    
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    HStack(spacing: 5) {
                                        Text(item.time)
                                            .font(.caption)
                                        
                                        Text(item.category.uppercased())
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        showPlayer.toggle()
                    }) {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                            .padding(.bottom)
                    }
                    .fullScreenCover(isPresented: $showPlayer, content: {
                        PlayerView(isPreview: true)
                            .environmentObject(audioManager)
                    })
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MeditationView()
        .environmentObject(AudioManager())
}

struct RelatedModel: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var time: String
    var category: String
}

var demoRelated: [RelatedModel] = [
    RelatedModel(image: "moon", name: "Moon Clouds", time: "45min", category: "Sleep Music"),
    RelatedModel(image: "sweet_sleep", name: "Sweet Sleep", time: "45min", category: "Sleep Music")
]

struct MeditationPlayerView: View { // Change here
    var body: some View {
        // Implement your player view here
        Text("Player View")
    }
}
