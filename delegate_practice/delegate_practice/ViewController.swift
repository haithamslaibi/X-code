//
//  ViewController.swift
//  delegate_practice
//
//  Created by HackerU on 11/04/2016.
//  Copyright © 2016 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,WetherStationDelegate{

    var numb = 0
    @IBAction func imageTApped(sender: UITapGestureRecognizer) {
        if numb < 44{
            numb += 1}
        else {
            numb = 0
        }
        imageView.image = images[numb]

    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initImages()
        let station = WetherStation()
        station.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wetherArrived(Number: Int) {
        //imageView.image = images[Number]
    }
    
    func initImages(){
        for i in 1...45{
            
            let iStr = String(format: "%04d", i)
            let image = UIImage(named: "www.dmzwarez.info_Natures_ \(iStr)")!
            images.append(image)
        }
    }


}

