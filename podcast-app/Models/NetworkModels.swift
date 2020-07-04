//
//  NetworkModels.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import Foundation


struct PodcastItemDTO : Decodable {
    let id: String
    let title: String
    let contentText: String
    let imageURL : String
    let playbackItems : [PlaybackDTO]
    
    enum CodingKeys: String, CodingKey {
        case id, title, contentText, playbackItems = "attachments", imageURL = "image"
    }
    
    /*
     Get the total duration of this podcast, in a human readable format.
     Eg.: "2:04s" (min/seconds)
     */
    func totalTimeDisplay() -> String {
        if let firstElem = playbackItems.first {
            return firstElem.durationInSeconds.displayTimeFromSeconds()
        } else {
            return "N/A"
        }
    }
    
    func getRelevantMedia() -> PlaybackDTO? {
        guard let playbackItem = playbackItems.first else {
            return nil
        }
        return playbackItem
    }
}

struct PlaybackDTO : Decodable {
    let url: String
    let durationInSeconds: Int
    
    func urlInstance() -> URL? {
        guard let url = URL(string: url) else { return nil }
        return url
    }
    
}


struct PodcastPageDTO : Decodable {
    let feedUrl: String // Serves as a way to uniquely identify this object.
    let title: String
    let homePageUrl: String
    let nextUrl: String
    let description: String
    let coverArtUrl: String
    let podcasts : [PodcastItemDTO]
    
    enum CodingKeys: String, CodingKey {
        case feedUrl, title, homePageUrl,nextUrl,description, coverArtUrl = "icon", podcasts = "items"
    }
}
