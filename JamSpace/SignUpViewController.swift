//
//  SignUpLoginViewController.swift
//  JamSpace
//
//  Created by Joao Paulo Galvao Alves on 8/25/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import ParseTwitterUtils



class SignUpLoginViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
  
  
  //MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    
  }
  
  override func viewDidAppear(animated: Bool) {
    var loginItems = PFLogInViewController()
    
    loginItems.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.Twitter | PFLogInFields.Facebook | PFLogInFields.SignUpButton
    
    loginItems.delegate = self
    loginItems.signUpController?.delegate = self
    
    self.presentViewController(loginItems, animated: true, completion: nil)
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

//MARK: - Parse's PFLoginViewControllerDelegate

extension SignUpLoginViewController : PFLogInViewControllerDelegate {
  
  func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
    
  }
  
}










