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
    
    let podcastItem: PodcastItemDTO
    
    var body: some View {
        let url = URL(string: podcastItem.imageURL)
        
        return VStack(spacing: 20) {
            HStack(spacing: 10) {
                CoverArt(url: url)
                
                VStack {
                    // Title.
                    Text(podcastItem.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                    
                    // Description
                    Text(podcastItem.contentText)
                        .font(.body)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity,
                    alignment: .leading)
                    
                    // Date
                    // TODO: Use date.
                    Text("2h ago")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity,
                    alignment: .leading)
                }
                
            }
            
        }
    }
    
}

struct PodcastListItemView_Previews: PreviewProvider {
    static var previews: some View {
        return PodcastListItemView(podcastItem: podcastItem1)
    }
}

struct CoverArt: View {
    
    let url: URL?
    
    var body: some View {
        KFImage(url)
            .placeholder {
                // Placeholder thumbnail.
                Image(systemName: "PodcastThumbnail")
                
        }
        .resizable()
        .aspectRatio(contentMode: ContentMode.fill)
        .frame(width: 96, height: 96)
        .cornerRadius(4)
        .shadow(radius: 4)
    }
}
