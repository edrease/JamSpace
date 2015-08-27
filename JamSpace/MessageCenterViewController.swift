//
//  MessageCenterViewController.swift
//  JamSpace
//
//  Created by Edrease Peshtaz on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import Parse

class MessageCenterViewController: UIViewController {
  
  var messages = [Message]()
  
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
  let kBottomViewConstraintPhoto : CGFloat = 108
  let kBottomViewConstraintPhotoRemoved : CGFloat = -108
  
  
  //MARK: - Lifecycle methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Delegate setup
    tableView.dataSource = self
    self.tabBarController?.delegate = self
    txtFieldFirstName.delegate = self
    txtFieldLastName.delegate = self
    
    let userOne = User(firstName: "Ed", lastName: "Peshtaz", favorites: nil)
    let messageOne = Message(user: userOne, messageText: "Hullo", profileImage: nil, dateSent: NSDate())
    messages.append(messageOne)
    
    
    let jamUser = PFUser.currentUser()?.username
    
    if (jamUser != nil) {
      println("user exists")
      
    } else {
      
      constraintBottomView.constant = kBottomViewConstraint
      
      UIView.animateWithDuration(0.3, animations: { () -> Void in
        self.view.layoutIfNeeded()
      })
      
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
    
    if switchHost.on == false {
      constraintPhotoBottomView.constant = kBottomViewConstraintPhotoRemoved
    } else {
      
      constraintPhotoBottomView.constant = kBottomViewConstraintPhoto
      
      UIImageView.animateWithDuration(0.3, animations: { () -> Void in
        self.view.layoutIfNeeded()
      })
      
    }

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
    
    constraintBottomView.constant = kBottomViewConstraint
    
    UIView.animateWithDuration(0.3, animations: { () -> Void in
      self.view.layoutIfNeeded()
    })
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
    cell.userName.text = message.user.firstName + " " + message.user.lastName
    cell.userProfileImage.image = message.profileImage
    cell.messageText.text = message.messageText
    let datePosted = DateToStringFormatter.stringFromDate(message.dateSent)
    cell.datePosted.text = datePosted
    
    return cell

  }
  
}
