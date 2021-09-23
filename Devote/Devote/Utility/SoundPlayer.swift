//
//  SoundView.swift
//  Devote
//
//  Created by Erasmo J.F Da Silva on 22/09/21.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playeSound(sound: String, type: String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}
