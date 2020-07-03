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


enum PlaybackState {
    case STOPPED
    case PLAYING
    case PAUSED
}
struct MediaState{
    var state = PlaybackState.STOPPED
    var currentProgressInSeconds = 0
    
    var selectedPodcast : PodcastItemDTO? = nil
    
    func isPlaying() -> Bool {
        return state == PlaybackState.PLAYING
    }
    
}

class PlaybackManager : ObservableObject {
    
   @Published var mediaState = MediaState()
    
   private let avPlayer: AVPlayer
    
    // Display playback on the system controls.
    private let notificationCenter: NotificationCenter
    private let systemPlayer: MPNowPlayingInfoCenter
   
    // MARK: Start and Stop.
    
    init(avPlayer: AVPlayer = AVPlayer(),
         notificationCenter: NotificationCenter = .default,
         systemPlayer: MPNowPlayingInfoCenter = MPNowPlayingInfoCenter.default()) {
        self.avPlayer = avPlayer
        
        // Handle system controls.
        self.notificationCenter = notificationCenter
        self.systemPlayer = systemPlayer
        self.notificationCenter.addObserver(self, selector: #selector(self.reachedEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        
        let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        self.avPlayer.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: refreshPlayer)
        
        let avSession: AVAudioSession = AVAudioSession.sharedInstance()
        try? avSession.setCategory(AVAudioSession.Category.playback,
                                   mode: AVAudioSession.Mode.default,
                                   options: [.allowBluetooth, .allowAirPlay, .defaultToSpeaker])
    }
    
    deinit {
        notificationCenter.removeObserver(self)
        avPlayer.removeTimeObserver(self)
    }
    
    // MARK : controls.
    
    /*
     This method assumes media have been loaded beforehand via the playPause() method.
     */
    func playPauseToggleButton(){
        guard let podcast = self.mediaState.selectedPodcast else {
            print("ERROR: Podcast is nil!")
            return
            
        }
        if (avPlayer.isPlaying()){
               pauseMedia()
           } else {
               playMedia(with: podcast)
           }
    }
    
    func play(podcast: PodcastItemDTO){
        self.mediaState.selectedPodcast = podcast
        playMedia(with: podcast, fromBeginning: true)
    }
    
    private func playMedia(with podcast: PodcastItemDTO, fromBeginning: Bool = false){
        if (progressSeconds > 1 && fromBeginning == false){
            // Resume
            avPlayer.play()
        } else {
            // Start from beginnng.
            
            guard let url = podcast.getRelevantMedia()?.urlInstance() else { return }
            avPlayer.replaceCurrentItem(with: AVPlayerItem(url: url))
            avPlayer.play()
        }
        
        notificationCenter.addObserver(self, selector: #selector(self.reachedEnd), name: AVAudioSession.interruptionNotification, object: nil)
        let info: [String: Any] = [
            MPMediaItemPropertyTitle: podcast.title,
        ]
        systemPlayer.nowPlayingInfo = info
        
        mediaState.state = PlaybackState.PLAYING
    }
    
    private func pauseMedia(){
        avPlayer.pause()
        mediaState.state = PlaybackState.PAUSED
        self.notificationCenter.removeObserver(self, name: AVAudioSession.interruptionNotification, object: nil)
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
    
    @objc private func reachedEnd() {
        mediaState.state = PlaybackState.STOPPED
    }
}
