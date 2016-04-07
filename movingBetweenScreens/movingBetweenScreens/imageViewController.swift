//
//  imageViewController.swift
//  movingBetweenScreens
//
//  Created by HackerU on 07/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {
    
    @IBOutlet weak var imageviewer: UIImageView!
    
    @IBAction func nextButtonIsPressed(sender: UIButton) {
        imageviewer.image = images[Int.randomnum(45)]
    }
    
    var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fill()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fill(){
        for i in 1...45{
            let iNum = String(format: "%04d", i)
            let image = UIImage(named: "www.dmzwarez.info_Natures_ \(iNum)")
            images.append(image!)
        }
    }
    
    @IBAction func ActionButtonIsPressed(sender: UIButton) {
        let acController = UIActivityViewController(activityItems: [imageviewer.image!], applicationActivities: nil )
        presentViewController(acController, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
