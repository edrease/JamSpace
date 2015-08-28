//
//  AccountViewController.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/27/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class GuestAccountViewController: UIViewController {
  
  //MARK: - Constants
  let kTrailingViewConstraint : CGFloat = -60
  let kTrailingViewConstraintRemove : CGFloat = 400
  
  //MARK: - Outlets
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
  
  //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewWillAppear(animated: Bool) {
    let jamUser = PFUser.currentUser()?.username
    
    if (jamUser != nil) {
      println("user exists")
      let jamUser = PFUser.currentUser()?.username
      
      constraintTrailingLoginView.constant = kTrailingViewConstraint
      
      UIView.animateWithDuration(0.3, animations: { () -> Void in
        self.view.layoutIfNeeded()
      })
      
    } else {
//      presentedSignup = true
      println("user does not exist!")
    
    }
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


extension GuestAccountViewController : UITabBarControllerDelegate {
  
  func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
    let jamUser = PFUser.currentUser()?.username
    
    if (jamUser != nil) {
      println("user exists")
      let jamUser = PFUser.currentUser()?.username
      
      constraintTrailingLoginView.constant = kTrailingViewConstraintRemove
      
      UIView.animateWithDuration(0.3, animations: { () -> Void in
        self.view.layoutIfNeeded()
      })
      
    } else {
      //      presentedSignup = true
      println("user does not exist!")
      
    }

  }
  
}












