//
//  HeaderView.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct HeaderView: View {
    
     let podcast: PodcastPageDTO
       
       var body: some View {
           let url = URL(string: podcast.coverArtUrl)
           
           return ZStack {
                PodcastCoverArt(imageUrl: url)
                PodcastHeaderText(title: podcast.title)
           }
       }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(podcast: podcastPreviewPage)
    }
}

struct PodcastHeaderText: View {
    let title: String
    var body: some View {
        VStack {
        Spacer()
        .frame(height: 70)
        Text(title)
            .font(.largeTitle)
        .lineLimit(2)
            .foregroundColor(Color("FontColorMain"))
        .frame(maxWidth: .infinity,
               alignment: .center)
    }
    }
}

struct PodcastCoverArt: View {
    
    let imageUrl: URL?
    
    var body: some View {
        ZStack {
            KFImage(imageUrl)
            .resizable()
            .aspectRatio(contentMode: ContentMode.fill)
            .frame(height: 160)
            .cornerRadius(0)
            .shadow(radius: 4)
            
            // Overlay coverart for improved readability if text.
            Rectangle()
            .fill(Color("CoverArtOverlay"))
            .frame(height: 160)
        }
        
    }
}
