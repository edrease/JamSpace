//
//  LocationSearchService.swift
//  JamSpace
//
//  Created by Edrease Peshtaz on 8/26/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import Foundation
import Parse

class LocationSearchService {
  
  class func locationsForSearchTerm(searchTerm: String, completionHandler: (String?, [PracticeSpace]?) -> (Void)) {
    
    let queryForLocations = PFQuery(className: "PracticeSpaces")
    queryForLocations.whereKey("city", equalTo: searchTerm)
    queryForLocations.findObjectsInBackgroundWithBlock { (practiceSpaces, error) -> Void in
      
      if let error = error {
        println(error.code)
      } else if let practiceSpaces = practiceSpaces as? [PracticeSpace] {
        
        let practiceSpaceArray = practiceSpaces
        println(practiceSpaces)
        completionHandler(nil, practiceSpaceArray)
      }
    }
  }
}