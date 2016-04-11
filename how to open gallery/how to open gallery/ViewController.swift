//
//  ViewController.swift
//  how to open gallery
//
//  Created by HackerU on 11/04/2016.
//  Copyright © 2016 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func imageViewIsTApped(sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
        imageView.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
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

