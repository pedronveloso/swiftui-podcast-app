//
//  NetworkingManager.swift
//  podcast-app
//
//  Created by user925476 on 7/1/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import Foundation

protocol NetworkResult {
    func onSuccess(podcastPage: PodcastPageDTO)
    func onFailure(errorMessage: String)
}


struct NetworkingManager {
    
    let callback: NetworkResult
    
    // TODO: Since the JSON Structure is the same, it will be easy to replace this URL with other feeds.
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
        
        // Print body for debug.
        if let safeData = data {
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
