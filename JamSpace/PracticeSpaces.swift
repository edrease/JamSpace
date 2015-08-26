//
//  PracticeSpaces.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import Parse

class PracticeSpace : PFObject, PFSubclassing {
  
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
    return "PracticeSpaces"
  }
  
  @NSManaged var city: String
  @NSManaged var zipcode: Int
  @NSManaged var streetAddress: String
  @NSManaged var nameOfSpace: String
  //let owner: User?
  @NSManaged var sizeInFeet: Int
  @NSManaged var pricePerDay: Int
  @NSManaged var isBasement: Bool
  @NSManaged var isRoom: Bool
  @NSManaged var isGarage: Bool
  @NSManaged var isStudio: Bool
  @NSManaged var imageFolder : [UIImage]
}




