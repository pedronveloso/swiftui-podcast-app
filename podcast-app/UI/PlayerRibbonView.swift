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
                .frame(height: footerHeight)
            
            HStack{
                Spacer().frame(width: sideMargin)
                CoverArtView(url: url, size: 48, cornerRadius: 2, shadowSize: 2)
                
                // Title and Progress.
                Button(action: {
                    // Clicking this area will show the item details screen.
                    self.router.isShowingDetails = true

                }) {
                    VStack{
                        TitleView(podcastItem: podcastItem)
                        
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

private struct TitleView: View {
    
    let podcastItem: PodcastItemDTO
    
    var body: some View {
        Text(podcastItem.title)
        .foregroundColor(Color("FontColorMain"))
            .font(.footnote)
        .lineLimit(1)
        .frame(maxWidth: .infinity,
        alignment: .leading)
    }
}
