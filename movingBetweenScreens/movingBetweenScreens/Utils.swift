//
//  File.swift
//  movingBetweenScreens
//
//  Created by HackerU on 07/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import Foundation

extension Int{
    static func randomnum(max : Int)->Int{
        var num = 0
        arc4random_buf(&num, sizeof(Int))
        return abs(num) % max
    }
}
