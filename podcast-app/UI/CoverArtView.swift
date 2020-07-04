//
//  CoverArtView.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct CoverArtView: View {
    
    let url: URL?
    let size: Int
    let cornerRadius: Int
    let shadowSize: Int
    
    var body: some View {
        KFImage(url)
            .placeholder {
                // Placeholder thumbnail.
                Image("PodcastThumbnail")
                
        }
        .resizable()
        .aspectRatio(contentMode: ContentMode.fill)
        .frame(width: CGFloat(size), height: CGFloat(size))
        .cornerRadius(CGFloat(cornerRadius))
        .shadow(radius: CGFloat(shadowSize))
    }
}

struct CoverArtView_Previews: PreviewProvider {
    static var previews: some View {
        CoverArtView(url: URL(string: "https://media.npr.org/assets/img/2020/03/24/undefined_sq-63f9f4b46bb9031d67f9785b66818f4befbab8bc.jpg?s=1400"), size: 192, cornerRadius: 6, shadowSize: 6)
    }
}
