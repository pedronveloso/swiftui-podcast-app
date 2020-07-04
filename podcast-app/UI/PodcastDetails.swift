//
//  PodcastDetails.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct PodcastDetails: View {
    
    @ObservedObject var playbackManager : PlaybackManager
    
    @State private var sliderValue = 0.0
    private let previewPodcastItem: PodcastItemDTO = podcastItem1
    
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
                .fill(Color("LightBackground"))
            
            
            VStack{
                Spacer().frame(height: 30)
                DetailsCoverArt(url: url)
                Text(podcastItem.title)
                    .foregroundColor(Color("FontColorMain"))
                    .font(.headline)
                    .lineLimit(2)
                    .padding(sideMargin)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                
                Text(podcastItem.contentText)
                    .foregroundColor(Color("FontColorMain"))
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .lineLimit(8)
                    .padding(sideMargin)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                PlaybackControlsView(playbackManager: playbackManager)
                
                Slider(value: Binding(
                    get: {
                        self.sliderValue
                },
                    set: {(newValue) in
                        print("Will slide to: \(newValue)")
                        self.sliderValue = newValue
                        self.playbackManager.seekToPosition(position: Float(newValue))
                }
                )).padding(sideMargin)
                
                PlaybackTextProgressView(playbackManager: playbackManager, podcastItem: podcastItem, align: .center)
                
                Spacer().frame(height: 20)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PodcastDetails_Previews: PreviewProvider {
    static var previews: some View {
        PodcastDetails(playbackManager: PlaybackManager())
    }
}

struct DetailsCoverArt: View {
    
    let url: URL?
    
    var body: some View {
        KFImage(url)
            .placeholder {
                // Placeholder thumbnail.
                Image("PodcastThumbnail")
                
        }
        .resizable()
        .aspectRatio(contentMode: ContentMode.fill)
        .frame(width: 192, height: 192)
        .cornerRadius(6)
        .shadow(radius: 6)
    }
}
