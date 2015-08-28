//
//  Users.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import Foundation
import Parse
import ParseUI
import UIKit

class User: PFObject, PFSubclassing {
  
  
  //MARK: PFSubclassing
  
  override class func initialize() {
    struct Static {
      static var onceToken : dispatch_once_t = 0;
    }
    dispatch_once(&Static.onceToken) {
      self.registerSubclass()
    }
  }
  
  static func parseClassName() -> String {
    return "User"
  }

  
  @NSManaged var firstName: String
  @NSManaged var lastName: String
  @NSManaged var favorites: [PracticeSpace]?
  
}

