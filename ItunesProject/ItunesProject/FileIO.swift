//
//  FileIO.swift
//  ItunesProject
//
//  Created by Haitham Slaibi on 5/9/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit

class FileIO{
    
    static func documentsURL()->NSURL{
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    }
    
    static func copyFile2(from:NSURL,to:NSURL){
        do{
            do {
                try NSFileManager.defaultManager().copyItemAtURL(from, toURL: to)
            }
            catch let e as NSError{
                print(e)
            }
            
            try NSFileManager.defaultManager().copyItemAtURL(from, toURL: to)
        }
        catch let err as NSError{
            print(err)
        }
    }
    
    static func fileURLInDocuments(fileName:String)->NSURL{
        let url = documentsURL().URLByAppendingPathComponent(fileName)
        return url
    }
}
