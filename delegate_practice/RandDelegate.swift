//
//  RandDelegate.swift
//  delegate_practice
//
//  Created by HackerU on 11/04/2016.
//  Copyright © 2016 hackeru. All rights reserved.
//

import Foundation

class WetherStation {
    
    var delegate : WetherStationDelegate?
    init (){
        NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: "dataChanged", userInfo: nil, repeats: true)
    }
    
    dynamic func dataChanged(){
        var rand = 0
        arc4random_buf(&rand, sizeof(Int))
        rand = abs(rand % 45)
        delegate?.wetherArrived(rand)
    }
}

protocol WetherStationDelegate {
    func wetherArrived (Number:Int)
}

