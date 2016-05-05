//
//  ViewController.swift
//  memory_game(home)
//
//  Created by Haitham Slaibi on 5/3/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var first_bool = false
    var first_text:String = ""
    
    @IBAction func Button_touched(sender: UIButton) {
        if first_bool == false{
            first_text = sender.currentTitle!
            sender.highlighted = yes
            
        }
        if first_bool == true{
            if first_text != sender.currentTitle! {
                sender.highlighted = false
            }
        }
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

