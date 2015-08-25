//
//  DateToStringFormatter.swift
//  JamSpace
//
//  Created by Edrease Peshtaz on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import Foundation

class DateToStringFormatter {
  
  class func stringFromDate(dateToFormat: NSDate) -> String {
    
    let formatter = NSDateFormatter()
    formatter.dateStyle = NSDateFormatterStyle.MediumStyle
    formatter.timeStyle = .ShortStyle
    let dateString = formatter.stringFromDate(dateToFormat)
    return dateString
  }
  
}