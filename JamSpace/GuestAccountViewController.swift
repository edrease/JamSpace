//
//  AccountViewController.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/27/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

class GuestAccountViewController: UIViewController {
  
  @IBOutlet weak var constraintTrailingLoginView: NSLayoutConstraint!
  
  
  
  
  @IBOutlet weak var toggleToHostMode: UIButton!
  
  @IBAction func switchToHostMode(sender: AnyObject) {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let window = appDelegate.window

    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var hostModeViewController = mainStoryboard.instantiateViewControllerWithIdentifier("HostModeTabBarController") as! UITabBarController
    
   window?.rootViewController = hostModeViewController
    
   window?.makeKeyAndVisible()
    
    

  }
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
