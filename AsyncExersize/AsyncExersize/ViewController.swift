//
//  ViewController.swift
//  AsyncExersize
//
//  Created by Haitham Slaibi on 5/5/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()
        imageView.hidden = true
        Label.hidden = true
        dispatch_async(Queues.background){
            let fire = self.fire({ (percentage) in
                dispatch_async(Queues.main){
                    self.progressView.progress = percentage
                }
            })
            dispatch_async(Queues.main){
                self.imageView.hidden = false
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.progressView.hidden = true
                self.imageView.image = fire
                self.Label.hidden = false
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fire(progress : (Float)->())->UIImage{
        for i in 0...100000{
            let now = (Float(i))/100000
            print ("\(now * 100) percent")
            if i % 100 == 0 {
                progress(now)
            }
        }
        return UIImage(named: "candle")!
    }
    
    func blow(){
        
    }

}

