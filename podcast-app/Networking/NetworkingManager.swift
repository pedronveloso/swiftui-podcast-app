//
//  NetworkingManager.swift
//  podcast-app
//
//  Created by user925476 on 7/1/20.
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
            let min = firstElem.durationInSeconds / 60
            let sec = firstElem.durationInSeconds - (min*60)
            return "\(min):\(sec)s"
        } else {
            return "N/A"
        }
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

protocol NetworkResult {
    func onSuccess(podcastPage: PodcastPageDTO)
    func onFailure(errorMessage: String)
}


struct NetworkingManager {
    
    let callback: NetworkResult
    
    let NPRUrl = "https://feeds.npr.org/510312/feed.json"
    
    func getFeed(){
        guard let url = URL(string: NPRUrl) else { return }
        
        // Setting some connection attributes.
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 300.0
        config.timeoutIntervalForResource = 300.0
        
        let session = URLSession(configuration: config)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: handleResponse(data: response: err: ))
        task.resume()
    }
    
    func handleResponse(data: Data?, response: URLResponse?, err: Error?){
        // Handle connectivity errors.
        if (err != nil){
            callback.onFailure(errorMessage: "Error when trying to handle request. E.: \(err.debugDescription)")
            return
        }
        
        if let response = response {
            print(response)
        }
        
        // Print body for debug.
        if let safeData = data {
            //let body = String(data: safeData, encoding: .utf8)
            //print(body)
            
            // Decoding portion.
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do{
                let podcasts = try decoder.decode(PodcastPageDTO.self, from: safeData)
                // Notify viewcontroller of results.
                callback.onSuccess(podcastPage: podcasts)
            } catch {
                callback.onFailure(errorMessage: "Error when trying to decode contents. E.: \(error.localizedDescription)")
                print(error)
            }
        }
        
    }
}
