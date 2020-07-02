//
//  NetworkingManager.swift
//  podcast-app
//
//  Created by user925476 on 7/1/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import Foundation

struct PodcastItemDTO : Decodable {
    var id: String
    var title: String
    var contentText: String
    var imageURL : String
    
    enum CodingKeys: String, CodingKey {
        case id, title, contentText, imageURL = "image"
    }
}


struct PodcastPageDTO : Decodable {
    var title: String
    var homePageUrl: String
    var nextUrl: String
    var description: String
    var podcasts : [PodcastItemDTO]
    
    enum CodingKeys: String, CodingKey {
        case title, homePageUrl,nextUrl,description, podcasts = "items"
    }
}

struct NetworkingManager {
    
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
        // TODO : handle error
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
                print(podcasts.podcasts[0])
            } catch {
                // TODO : handle decoding error
                print(error)
            }
        }
        
    }
}
