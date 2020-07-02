//
//  ContentView.swift
//  podcast-app
//
//  Created by user925476 on 7/1/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
            Button(action: {
                let net = NetworkingManager.init()
                net.getFeed()
            }) {
                Text("Make request")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
