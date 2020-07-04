//
//  PlayerRibbonView.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct PlayerRibbonView: View {
    
    @ObservedObject var playbackManager : PlaybackManager
    private let previewPodcastItem: PodcastItemDTO = podcastItem1
    
    @ObservedObject var router : Router
    
    var body: some View {
        let podcastItem: PodcastItemDTO
        if (self.playbackManager.mediaState.selectedPodcast != nil){
            podcastItem = self.playbackManager.mediaState.selectedPodcast!
        } else {
            podcastItem = previewPodcastItem
        }
        let url = URL(string: podcastItem.imageURL)
        
        return ZStack {
            Rectangle()
                .fill(Color("FooterColor"))
                .frame(height: 64)
            
            HStack{
                Spacer().frame(width: sideMargin)
                RibbonCoverArt(url: url)
                
                // Title and Progress.
                Button(action: {
                    print("Click to show details")
                    self.router.isShowingDetails = true

                }) {
                    VStack{
                        
                        Text(podcastItem.title)
                        .foregroundColor(Color("FontColorMain"))
                            .font(.footnote)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity,
                        alignment: .leading)
                        
                        PlaybackTextProgressView(playbackManager: playbackManager, podcastItem: podcastItem, align: .leading)
                        
                    }
                }
                
                
                Spacer()
                PlaybackControlsView(playbackManager: playbackManager)
                Spacer().frame(width: sideMargin*2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct PlayerRibbonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRibbonView(playbackManager: PlaybackManager(), router: Router())
    }
}

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

struct RibbonCoverArt: View {
    
    let url: URL?
    
    var body: some View {
        KFImage(url)
            .placeholder {
                // Placeholder thumbnail.
                Image("PodcastThumbnail")
                
        }
        .resizable()
        .aspectRatio(contentMode: ContentMode.fill)
        .frame(width: 48, height: 48)
        .cornerRadius(2)
        .shadow(radius: 2)
    }
}
