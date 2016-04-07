//
//  ViewController.swift
//  timer
//
//  Created by HackerU on 07/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer:NSTimer!
    
    @IBAction func buttonispressed(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerfunc", userInfo: nil, repeats: true)
    }
    
    var counter = 10
    func timerfunc (){
        if counter == 0{
            performSegueWithIdentifier("secondscreen", sender: nil)
            timer.invalidate()
        }
        timeLabel.text = counter.description
        counter -= 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

