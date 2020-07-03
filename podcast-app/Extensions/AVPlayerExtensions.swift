//
//  AVPlayerExtensions.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import Foundation
import MediaPlayer

public extension AVPlayer {
    func isPlaying() -> Bool {
    return self.rate != 0
  }
}
