//
//  ContentView.swift
//  podcast-app
//
//  Created by user925476 on 7/1/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var playbackManager = PlaybackManager()
    
    @State var results : [PodcastPageDTO]
    
    @ObservedObject var router = Router()
    
    var body: some View {
        // Set the list elements background.
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor(named: "LightBackground")
        UITableView.appearance().backgroundColor = UIColor(named: "LightBackground")
        
        return NavigationView {
            ZStack{
                // Background.
                Rectangle()
                    .fill(Color("LightBackground"))
                
                NavigationLink(destination: PodcastDetails(playbackManager: playbackManager), isActive: $router.isShowingDetails) { EmptyView() }
                
                MainScreenView(playbackManager: playbackManager, results: self.results, router: router)
                
                
            }.edgesIgnoringSafeArea(.all)
        }
    }
}


struct MainScreenView : View, NetworkResult  {
    
    @ObservedObject var playbackManager : PlaybackManager
    
    @State var results : [PodcastPageDTO]
    
    @ObservedObject var router : Router
    
    
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
    
    var body: some View {
        return VStack{
            if (results.isEmpty == false){
                HeaderView(podcast: results[0])
                
                // Render items.
                List(results[0].podcasts, id: \.id) { item in
                    PodcastListItemView(playbackManager: self.playbackManager, podcastItem: item)
                }
                
                // Player Ribbon.
                if (playbackManager.mediaState.selectedPodcast != nil){
                    PlayerRibbonView(playbackManager: playbackManager, router: self.router)
                }
            } else {
                // TODO : Show better looking loading state.
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
