//
//  Result.swift
//  ItunesProject
//
//  Created by Haitham Slaibi on 5/9/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import Foundation

class Result:CustomStringConvertible{
    var previewUrl:String
    var trackName:String
    var artistName:String
    
    init(url:String , trackname:String , artistname :String){
        self.previewUrl = url
        self.trackName = trackname
        self.artistName = artistname
        
    }
    var description: String{
        return "\(previewUrl) , \(trackName) , \(artistName)"
    }
}
