//
//  PlaybackManager.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

/*
 This file contains the logic and necessary operations for the playback of podcasts.
 */
import Foundation
import MediaPlayer
import Combine
import SwiftUI

struct MediaState{
    var isPlaying = false
    var currentProgressInSeconds = 0
}

class PlaybackManager : ObservableObject {
    
    @Published var mediaState = MediaState()
    
   var currentPlaybackModel: PlaybackDTO?
   private let avPlayer: AVPlayer
   
    // MARK: Start and Stop.
    
    init(avPlayer: AVPlayer = AVPlayer()) {
        self.avPlayer = avPlayer
        // TODO : Display notifications for playback as well.
        
        let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        self.avPlayer.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: refreshPlayer)
        
        let avSession: AVAudioSession = AVAudioSession.sharedInstance()
        try? avSession.setCategory(AVAudioSession.Category.playback,
                                   mode: AVAudioSession.Mode.default,
                                   options: [.allowBluetooth, .allowAirPlay, .defaultToSpeaker])
    }
    
    deinit {
        avPlayer.removeTimeObserver(self)
    }
    
    // MARK : controls.
    
    func playPause(media: PlaybackDTO){
        self.currentPlaybackModel = media
        if (avPlayer.isPlaying())
        {
            avPlayer.pause()
            mediaState.isPlaying = false
        } else {
            if (progressSeconds > 1){
                // Resume
                avPlayer.play()
                print("Resuming")
            } else {
                // Start from beginnng.
                print("Playing from the beginning")
                guard let url = media.urlInstance() else { return }
                avPlayer.replaceCurrentItem(with: AVPlayerItem(url: url))
                avPlayer.play()
            }
            mediaState.isPlaying = true
        }
    }
    
    // MARK : Playback properties.
    
    var progressSeconds: Float {
        if (avPlayer.currentItem == nil){
            return 0
        }
        return Float(CMTimeGetSeconds(avPlayer.currentTime()))
    }
    
    // MARK: Event processing.
    
    private func refreshPlayer(time: CMTime) {
        mediaState.currentProgressInSeconds = Int(progressSeconds)
    }
}
