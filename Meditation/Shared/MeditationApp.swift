//
//  MeditationApp.swift
//  Shared
//
//  Created by parichartsa on 13/5/2567 BE.
//

import SwiftUI

@main
struct MeditationApp: App {
    
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
