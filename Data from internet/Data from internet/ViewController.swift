//
//  ViewController.swift
//  Data from internet
//
//  Created by Haitham Slaibi on 5/5/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let source = ReditDataSource()
        source.simpleDemo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

