//
//  PodcastDetails.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

/*
 Podcast details screen.
 */
struct PodcastDetails: View {
    
    @ObservedObject var playbackManager : PlaybackManager
    
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
                CoverArtView(url: url, size: 192, cornerRadius: 6, shadowSize: 6)
                
                TitleAndDescriptionView(podcastItem: podcastItem)
                Spacer().frame(height: 10)
                
                PlaybackControlsView(playbackManager: playbackManager)
                SliderView(playbackManager: playbackManager)
                PlaybackTextProgressView(playbackManager: playbackManager, podcastItem: podcastItem, align: .center)
                
                // Some space at the bottom for aesthetics.
                Spacer().frame(height: 20)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}


struct PodcastDetails_Previews: PreviewProvider {
    static var previews: some View {
        PodcastDetails(playbackManager: PlaybackManager())
    }
}

private struct TitleAndDescriptionView : View {
    
    let podcastItem: PodcastItemDTO
    
    var body: some View {
        VStack{
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
            
        }
    }
}

private struct SliderView: View {
    
    @ObservedObject var playbackManager : PlaybackManager
    @State private var sliderValue = 0.0
    
    var body: some View {
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
    }
}
