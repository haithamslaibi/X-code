//
//  ViewController.swift
//  Calculator
//
//  Created by HackerU on 31/03/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    
    func start(){
        Label.layer.borderWidth = 1.5
        num1.layer.borderWidth = 1.5
        num2.layer.borderWidth = 1.5
        num3.layer.borderWidth = 1.5
        num4.layer.borderWidth = 1.5
        num5.layer.borderWidth = 1.5
        num6.layer.borderWidth = 1.5
        num7.layer.borderWidth = 1.5
        num8.layer.borderWidth = 1.5
        num9.layer.borderWidth = 1.5


        
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

