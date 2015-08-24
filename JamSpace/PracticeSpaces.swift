//
//  PracticeSpaces.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import Foundation

struct PracticeSpace {
  //let city: data type for city exist?
  var nameOfSpace: String
  let owner: User
  var sizeInFeet: Int
  var pricePerDay: Int
  let streetAddress: String
  //var imageFolder: [UIImage] how to create an array of images within a struct??
  enum spaceType {
    case basement
    case garage
    case roomInHouse
    case entireHouse
    case roomInRecordingStudio
  }
}
