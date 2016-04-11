//
//  ViewController.swift
//  GalleryDemo
//
//  Created by HackerU on 11/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentImageIndex = 0{
        didSet{
           currentImageIndex = currentImageIndex >= images.count ? 0 : currentImageIndex
           currentImageIndex = currentImageIndex <= 0 ? images.count - 1 : currentImageIndex
           updateImage()
        }
    }
    
    @IBAction func rightButton(sender: UIButton) {
        currentImageIndex += 1
    }
    
    @IBAction func leftButton(sender: UIButton) {
        currentImageIndex -= 1
    }
    
    func updateImage(){
        currentImageIndex += 1
        imageView.image = images[currentImageIndex]
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initImages()
        updateImage()
        NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: "updateImage", userInfo: nil, repeats: true)

    }

    func initImages(){
        for i in 1...45{
            
            let iStr = String(format: "%04d", i)
            let image = UIImage(named: "www.dmzwarez.info_Natures_ \(iStr)")!
            images.append(image)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

