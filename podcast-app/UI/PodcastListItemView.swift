//
//  PodcastListItemView.swift
//  podcast-app
//
//  Created by user925476 on 7/2/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct PodcastListItemView: View {
    
    @ObservedObject var playbackManager : PlaybackManager
    
    let podcastItem: PodcastItemDTO
    
    var body: some View {
        let url = URL(string: podcastItem.imageURL)
        
        return
            VStack {
            HStack(spacing: 20) {
                CoverArt(url: url)
                
                Button(action: {
                    self.playbackManager.play(podcast: self.podcastItem)
                }) {
                    VStack {
                        // Title.
                        Text(podcastItem.title)
                            .font(.headline)
                            .foregroundColor(Color("FontColorMain"))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        
                        // Description
                        Spacer().frame(height: 2)
                        Text(podcastItem.contentText)
                            .foregroundColor(Color("FontColorMain"))
                            .font(.subheadline)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity,
                        alignment: .leading)
                        
                        // Date
                        // TODO: Use date.
                        Spacer().frame(height: 6)
                        Text("2h ago")
                            .font(.caption)
                            .foregroundColor(Color("FontColorSubtle"))
                            .lineLimit(1)
                            .frame(maxWidth: .infinity,
                        alignment: .leading)
                    }
                }
                
        }
        }.background(Color("LightBackground"))
    }
    
}

struct PodcastListItemView_Previews: PreviewProvider {
    static var previews: some View {
        return PodcastListItemView(playbackManager: PlaybackManager(), podcastItem: podcastItem1)
    }
}

struct CoverArt: View {
    
    let url: URL?
    
    var body: some View {
        KFImage(url)
            .placeholder {
                // Placeholder thumbnail.
                Image("PodcastThumbnail")
                
        }
        .resizable()
        .aspectRatio(contentMode: ContentMode.fill)
        .frame(width: 96, height: 96)
        .cornerRadius(4)
        .shadow(radius: 4)
    }
}
