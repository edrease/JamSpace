//
//  Message.swift
//  JamSpace
//
//  Created by Edrease Peshtaz on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class Message : PFObject, PFSubclassing {
  
  override class func initialize() {
    struct Static {
      static var onceToken : dispatch_once_t = 0;
    }
    dispatch_once(&Static.onceToken) {
      self.registerSubclass()
    }
  }
  
  static func parseClassName() -> String {
    return "Messages"
  }
  
  @NSManaged var user: PFRelation
  @NSManaged var messageText: String
  @NSManaged var profileImage: UIImage?
  @NSManaged var dateSent: NSDate
  
}



