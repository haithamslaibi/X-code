//
//  File.swift
//  Data from internet
//
//  Created by Haitham Slaibi on 5/5/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit

class ReditDataSource{
    
    func simpleDemo(){
        
        let session = NSURLSession.sharedSession()
        
        guard let url = NSURL(string: "https://www.reddit.com/r/funny/.json")else{return}
        
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            if let data = data{
                //let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
                
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
                    print (json)
                    let reddits = json["data"]!!["children"] as! NSArray
                    for reddit in reddits{
                        let url = reddit["data"]!!["url"] as! String
                        let id = reddit["reddit"]!!["id"] as! String
                        
                        print(url,id)
                    }
                }
                catch let error as NSError{
                    print(error.description)
                }
            }
        }
        task.resume()
    }
    
}