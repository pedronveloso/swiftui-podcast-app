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
    
    let podcastItem: PodcastItemDTO
    
    var body: some View {
        let url = URL(string: podcastItem.imageURL)
        let shorterTitle = podcastItem1.title[..<15]
        
        return ZStack {
            Rectangle()
                .fill(Color("FooterColor"))
                .frame(height: 64)
            
            HStack{
                Spacer().frame(width: sideMargin)
                RibbonCoverArt(url: url)
                
                // Progress
                VStack{
                    
                    Text(shorterTitle)
                    .foregroundColor(Color("FontColorMain"))
                        .font(.footnote)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity,
                    alignment: .leading)
                    
                    Text("2:30 / 14:00")
                    .foregroundColor(Color("FontColorMain"))
                        .font(.footnote)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity,
                    alignment: .leading)
                }
                
                Spacer()
                PlaybackControls()
                Spacer().frame(width: sideMargin*2)
            }
        }
            
        .frame(maxWidth: .infinity)
    }
}

struct PlayerRibbonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRibbonView(podcastItem: podcastItem1)
    }
}

struct PlaybackControls : View {
    var body: some View {
        HStack{
            
            Image(systemName: "gobackward.10")
            .imageScale(.large)
            .foregroundColor(Color.white)
            Spacer()
            .frame(width: 20)
            
            Image(systemName: "play")
            .imageScale(.large)
            .foregroundColor(Color.white)
            
            Spacer()
            .frame(width: 20)
            
            Image(systemName: "goforward.10")
            .imageScale(.large)
            .foregroundColor(Color.white)
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