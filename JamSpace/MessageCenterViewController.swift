//
//  MessageCenterViewController.swift
//  JamSpace
//
//  Created by Edrease Peshtaz on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MessageCenterViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
  
  var messages = [Message]()
  var loginItems = PFLogInViewController()
  var signUpItems = PFSignUpViewController()
  
  //MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var imgViewUser: UIImageView!
  @IBOutlet weak var buttonCamera: UIButton!
  @IBOutlet weak var txtFieldFirstName: UITextField!
  @IBOutlet weak var txtFieldLastName: UITextField!
  @IBOutlet weak var viewAdditionalInfo: UIView!
  
  @IBOutlet weak var switchHost: UISwitch!
  @IBOutlet weak var buttonSend: UIButton!
  @IBOutlet weak var constraintBottomView: NSLayoutConstraint!
  
  @IBOutlet weak var constraintPhotoBottomView: NSLayoutConstraint!
  @IBOutlet weak var contraintCameraBottomView: NSLayoutConstraint!
  //MARK: - Constants
  let kBottomViewConstraint : CGFloat = 100
  let kBottomViewConstraintRemoved : CGFloat = -400
  let kBottomViewConstraintPhoto : CGFloat = 50
  let kBottomViewConstraintPhotoRemoved : CGFloat = -108
  let kBottomViewConstraintCameraButtonRemoved: CGFloat = -50
  let kBottomViewConstraintCameraButton : CGFloat = 43
  var presentedSignup = false
  
  //MARK: - Lifecycle methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Delegate setup
    tableView.dataSource = self
    self.tabBarController?.delegate = self
    txtFieldFirstName.delegate = self
    txtFieldLastName.delegate = self
    loginItems.delegate = self
    signUpItems.delegate = self
    loginItems.signUpController?.delegate = self
    
//    var users = PFUser()
//    users["name"] = txtFieldFirstName.text
    
    
    
//    presentedSignup = true
    
    
  }
  
  override func viewWillAppear(animated: Bool) {
    let jamUser = PFUser.currentUser()?.username
    
    if (jamUser != nil) {
      
      println("user exists")
      
      MessageService.messagesService { (errorDescription, messages) -> (Void) in
        
        if let messages = messages {
          NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
            println(messages)
            println("messageService called")
            self.messages = messages
            self.tableView.reloadData()
          })
        }
      }
      
    } else  if presentedSignup == false{
      presentedSignup = true
      
      let jamUser = PFUser.currentUser()?.username
      
      loginItems.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.PasswordForgotten | PFLogInFields.SignUpButton
      
      signUpItems.fields = PFSignUpFields.UsernameAndPassword | PFSignUpFields.Email | PFSignUpFields.SignUpButton | PFSignUpFields.DismissButton
      
      self.presentViewController(loginItems, animated: true, completion: nil)
      //self.presentViewController(signUpItems, animated: true, completion: nil)
      
      //      constraintBottomView.constant = kBottomViewConstraint
      //      constraintPhotoBottomView.constant = kBottomViewConstraintPhotoRemoved
      //      contraintCameraBottomView.constant = kBottomViewConstraintCameraButtonRemoved
      //
      //      UIView.animateWithDuration(0.3, animations: { () -> Void in
      //        self.view.layoutIfNeeded()
      //      })
      
    }
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    let jamUser = PFUser.currentUser()?.username
    
    if (jamUser != nil) {
      println("user exists")
      
    } else  if presentedSignup == false{
      presentedSignup = true
      
      let jamUser = PFUser.currentUser()?.username
      
      signUpItems.fields = PFSignUpFields.UsernameAndPassword | PFSignUpFields.Email | PFSignUpFields.SignUpButton | PFSignUpFields.DismissButton
      
      
      self.presentViewController(signUpItems, animated: true, completion: nil)
      
//      constraintBottomView.constant = kBottomViewConstraint
//      constraintPhotoBottomView.constant = kBottomViewConstraintPhotoRemoved
//      contraintCameraBottomView.constant = kBottomViewConstraintCameraButtonRemoved
//      
//      UIView.animateWithDuration(0.3, animations: { () -> Void in
//        self.view.layoutIfNeeded()
//      })
      
    }
  }
  
  override func viewDidDisappear(animated: Bool) {
    
    constraintBottomView.constant = kBottomViewConstraintRemoved
    
    UIView.animateWithDuration(0.3, animations: { () -> Void in
      self.view.layoutIfNeeded()
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  //MARK: - My actions
  @IBAction func triggerCamera(sender: AnyObject) {
    
  }
  
  
  @IBAction func uploadAdditionalData(sender: AnyObject) {
    
    
    
  }
  
  @IBAction func toggleToHostUser(sender: AnyObject) {
    
    if switchHost.on == true {
      
      
      constraintPhotoBottomView.constant = kBottomViewConstraintPhoto
      contraintCameraBottomView.constant = kBottomViewConstraintCameraButton
      
      
      UIImageView.animateWithDuration(0.3, animations: { () -> Void in
        self.view.layoutIfNeeded()
      })

    } else {
      constraintPhotoBottomView.constant = kBottomViewConstraintPhotoRemoved
      contraintCameraBottomView.constant = kBottomViewConstraintCameraButtonRemoved
    }

  }
}


//MARK: - Parse's PFLoginViewControllerDelegate

extension MessageCenterViewController : PFLogInViewControllerDelegate {
  
  
  func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
}

//MARK: - Parse's PFSignupViewControllerDelegate

extension MessageCenterViewController : PFSignUpViewControllerDelegate {
  func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
    
    signUpItems.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {

    signUpItems.dismissViewControllerAnimated(true, completion: { () -> Void in
      self.presentedSignup = true
    })
  }
  
}


//MARK: - UITextFieldDelegate

extension MessageCenterViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    if textField == txtFieldFirstName {
      txtFieldLastName.becomeFirstResponder()
    } else if textField == txtFieldLastName {
      textField.resignFirstResponder()
    }
    
    
    return true
  }
  
}

//MARK: - UITabBarDelegate

extension MessageCenterViewController: UITabBarControllerDelegate{
  func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
    
    if tabBarController.selectedIndex == 1{
      presentedSignup = false
    }
    
    let jamUser = PFUser.currentUser()?.username
    
    if (jamUser != nil) {
      println("user exists")
      
    } else  if presentedSignup == false{
      presentedSignup = true
      
      let jamUser = PFUser.currentUser()?.username
      
      signUpItems.fields = PFSignUpFields.UsernameAndPassword | PFSignUpFields.Email | PFSignUpFields.SignUpButton | PFSignUpFields.DismissButton
      
      
      self.presentViewController(signUpItems, animated: true, completion: nil)
      
      //      constraintBottomView.constant = kBottomViewConstraint
      //      constraintPhotoBottomView.constant = kBottomViewConstraintPhotoRemoved
      //      contraintCameraBottomView.constant = kBottomViewConstraintCameraButtonRemoved
      //
      //      UIView.animateWithDuration(0.3, animations: { () -> Void in
      //        self.view.layoutIfNeeded()
      //      })
      
    }
    
//    constraintBottomView.constant = kBottomViewConstraint
//    switchHost.on = false
//    
//    UIView.animateWithDuration(0.3, animations: { () -> Void in
//      self.view.layoutIfNeeded()
//    })
  }
}

//MARK: - UITableViewDataSource

extension MessageCenterViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MessageCenterCell
    let message = messages[indexPath.row]
    //cell.userProfileImage.image = message.profileImage
    cell.messageText.text = message.messageText
    let datePosted = DateToStringFormatter.stringFromDate(message.dateSent)
    cell.datePosted.text = datePosted
    
    return cell

  }
  
}
