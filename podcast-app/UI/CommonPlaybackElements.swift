//
//  CommonPlaybackElements.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI

struct PlaybackTextProgressView : View {
    
    @ObservedObject var playbackManager : PlaybackManager
    let podcastItem: PodcastItemDTO
    let align: Alignment
    
    var body : some View {
        let progressText = "\(self.playbackManager.mediaState.progressSecondsDisplay()) / \(podcastItem.totalTimeDisplay())"
        
        return Text(progressText)
        .foregroundColor(Color("FontColorMain"))
            .font(.footnote)
        .lineLimit(1)
        .frame(maxWidth: .infinity,
        alignment: align)
    }
}

struct PlaybackControlsView : View {
    
    @ObservedObject var playbackManager : PlaybackManager
    
    var body: some View {
        let icon: String
        if (playbackManager.mediaState.isPlaying()){
            icon = "pause"
        } else {
            icon = "play"
        }
        
        return HStack{
            Button(action: {
                self.playbackManager.rewindPlayback()
              print("back button pressed")

            }) {
                Image(systemName: "gobackward.10")
                .imageScale(.large)
                .foregroundColor(Color.white)
            }
            
            Spacer()
            .frame(width: 20)
            
            Button(action: {
                self.playbackManager.playPauseToggleButton()
              print("play button pressed")

            }) {
                Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(Color.white)
            }
            
            Spacer()
            .frame(width: 20)
            
            Button(action: {
                self.playbackManager.forwardPlayback()
              print("forward button pressed")

            }) {
                Image(systemName: "goforward.10")
                .imageScale(.large)
                .foregroundColor(Color.white)
            }
        }
    }
}
