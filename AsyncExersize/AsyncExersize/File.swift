//
//  File.swift
//  AsyncExersize
//
//  Created by Haitham Slaibi on 5/5/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit
struct Queues {
    
    static let userInitiated = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
    
    static let userInteractive = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)
    
    static let utility = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
    
    static let background = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
    
    static let main = dispatch_get_main_queue()
    
    static let mSerializer = dispatch_queue_create("my-serial-queue", DISPATCH_QUEUE_SERIAL)
}

