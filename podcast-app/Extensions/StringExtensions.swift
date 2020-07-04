//
//  StringExtensions.swift
//  podcast-app
//
//  Created by Pedro Veloso on 7/3/20.
//  Copyright © 2020 pedro veloso. All rights reserved.
//

import Foundation



public extension Int {
    /*
    Get the total duration of this podcast, in a human readable format.
    Eg.: "2:04s" (min/seconds)
    */
func displayTimeFromSeconds() -> String {

        let min = self / 60
        let sec = self - (min*60)
        return "\(min):\(sec)s"
    }
}
