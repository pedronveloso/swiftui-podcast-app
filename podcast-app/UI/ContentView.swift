//
//  ContentView.swift
//  podcast-app
//
//  Created by user925476 on 7/1/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI

struct ContentView: View, NetworkResult  {
    
    @ObservedObject var playbackManager = PlaybackManager()
    
    func loadPodcasts(){
        let net = NetworkingManager.init(callback: self)
        net.getFeed()
    }
    
    func onSuccess(podcastPage: PodcastPageDTO) {
        results.append(podcastPage)
    }
    
    func onFailure(errorMessage: String) {
        // NOTHING YET.
    }
    
    @State var results : [PodcastPageDTO]
    
    var body: some View {
        UITableView.appearance().separatorStyle = .none
      UITableViewCell.appearance().backgroundColor = UIColor(named: "LightBackground")
      UITableView.appearance().backgroundColor = UIColor(named: "LightBackground")
        
        return ZStack{
            // Background.
            Rectangle()
            .fill(Color("LightBackground"))
                
            
        VStack{
            if (results.isEmpty == false){
                HeaderView(podcast: results[0])
                
                // Render items.
                List(results[0].podcasts, id: \.id) { item in
                    PodcastListItemView(podcastItem: item)
                    
                }
                
                // Player Ribbon.
                PlayerRibbonView(podcastItem: podcastItem1)
            } else {
                // TODO : Show loading state.
                Text("Loading Podcast")
                .font(.title)
                .onAppear(perform: loadPodcasts)
                
                Button(action: {
                    let net = NetworkingManager.init(callback: self)
                    net.getFeed()
                }) {
                    Text("Try again")
                }
            }
        }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // The following allows us to preview both Light and Dark themes.
        Group {
             ContentView(results: [podcastPreviewPage])
              .environment(\.colorScheme, .light)

            ContentView(results: [podcastPreviewPage])
              .environment(\.colorScheme, .dark)
        }
       
    }
}
