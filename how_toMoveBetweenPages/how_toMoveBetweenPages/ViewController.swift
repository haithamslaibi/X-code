//
//  ViewController.swift
//  how_toMoveBetweenPages
//
//  Created by HackerU on 04/04/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
   
    @IBAction func settingsButton(sender: AnyObject) {
        if let vr = storyboard?.instantiateViewControllerWithIdentifier("Settings1") as? SettingsViewController{
            presentViewController(vr, animated: true, completion: nil)
        }
    
    }
    
    @IBAction func goToSetiings(sender: UIButton) {
        performSegueWithIdentifier("Settings1", sender: nil)
    }
    @IBAction func touchedSomeplace(sender: UITapGestureRecognizer) {
        removeKeyboard(self.view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dest = segue.destinationViewController as? NextViewController{
            dest.data = Username?.text
        }
    }
    
    

}

