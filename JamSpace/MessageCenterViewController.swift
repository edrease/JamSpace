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
  
  @IBOutlet weak var switchHost: UISwitch!
  @IBOutlet weak var buttonSend: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    let userOne = User(firstName: "Ed", lastName: "Peshtaz", favorites: nil)
    let messageOne = Message(user: userOne, messageText: "Hullo", profileImage: nil, dateSent: NSDate())
    messages.append(messageOne)
    
    let jamUser = PFUser.currentUser()?.username
    
    if (jamUser != nil) {
      println("user exists")
      
    } else {
      
      
    }
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func triggerCamera(sender: AnyObject) {
  }
  @IBAction func uploadAdditionalData(sender: AnyObject) {
  }
}



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
