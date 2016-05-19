//
//  DataSource.swift
//  ItunesProject
//
//  Created by Haitham Slaibi on 5/9/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit
//"https://itunes.apple.com/search?media=music&entity=song&term=swift\(searchTerm)")
class ItunesDataSource{
    
    var tracks = [Result]()
    
    let url = NSURL(string:"https://itunes.apple.com/search?media=music&entity=song&term=swift")!
    let session = NSURLSession.sharedSession()
    
    func downloadTrack(indexPath:NSIndexPath , track:Result , resultBlock:(NSIndexPath)->() ){
        
        let urls = NSURL(string: track.previewUrl)!
        
        let task = session.downloadTaskWithURL(urls) { (fileUrl , response , error) -> Void in
            
            guard let fileUrl = fileUrl else {return}
            
            let originalFileName:String = urls.lastPathComponent!
            
            let destURL = FileIO.fileURLInDocuments(originalFileName)
            
            FileIO.copyFile2(fileUrl, to: destURL)
            
            print ("\(fileUrl) ,\(destURL) " ,separator: "\n", terminator: "\n________\n")
            resultBlock(indexPath)
            
        }
        
        task.resume()
    }
    
    
    func getData(resultBlock: ([Result])->()){
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            
            guard let data = data else {return}
            
            let json =  try?  NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            guard let arr = json?["results"] as? NSArray else{return}
            
            var results = [Result]()
            
            for item in arr{
                let urll = item["previewUrl"] as! String
                let tracknamee = item["trackName"] as! String
                let artistnamee = item["artistName"] as! String
                
                let r = Result(url: urll,trackname: tracknamee , artistname: artistnamee)
                
                results.append(r)
            }
            //return the data using the delegate block
            dispatch_async(Queues.main, { () -> Void in
                self.tracks = results
                resultBlock(results)
            })
            
        }
        
        task.resume()
    }
}
