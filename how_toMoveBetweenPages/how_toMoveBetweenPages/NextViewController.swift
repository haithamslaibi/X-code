//
//  NextViewController.swift
//  how_toMoveBetweenPages
//
//  Created by HackerU on 04/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var data:String?{
        didSet{
            updateUI()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
        
    }
    
    func paintViews(view:UIView){
        view.backgroundColor = UIColor.redColor()
        for v in view.subviews{
            paintViews(v)
        }
    }
    
    
    func updateUI(){
        nameLabel?.text = data
    }
    
    
    
}


extension UIViewController{
    func removeKeyboard(view:UIView){
        view.resignFirstResponder()
        for v in view.subviews{
            removeKeyboard(v)
        }
    }
}




