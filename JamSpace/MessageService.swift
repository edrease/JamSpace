//
//  MessageService.swift
//  JamSpace
//
//  Created by Joao Paulo Galvao Alves on 8/27/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import Foundation
import Parse
import ParseUI

class MessageService {
  class func messagesService(completionHandler: (String?, [Message]?) -> (Void)) {
    
    let queryForMessages = PFQuery(className: "Messages")
    queryForMessages.whereKey("sender", equalTo: PFUser.currentUser()!)
    queryForMessages.findObjectsInBackgroundWithBlock { (messages, error) -> Void in
      
      if let error = error {
        
        println(error.code)
        
      } else if let messages = messages as? [Message] {
        
        let messagesArray = messages
        println(messages)
        completionHandler(nil, messagesArray)
      }
    }
  }
}