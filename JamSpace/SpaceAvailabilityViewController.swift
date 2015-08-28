
//Brad Johnson [10:13 AM]10:13
//
//  SpaceAvailabilityViewController.swift
//  JamSpace
//
//  Created by Mick Soumphonphakdy on 8/27/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

protocol availableDatesSelectedDelegate : class {
  func uiPickerAvailableDatesSelected(startDate:NSDate, endDate: NSDate) -> (Void)
}

class SpaceAvailabilityViewController: UIViewController {
  
  weak var dateDelegate : availableDatesSelectedDelegate?
  var selectedStartDate : NSDate?
  var selectedEndDate : NSDate?
  
  //
  @IBOutlet weak var startDatePicker: UIDatePicker!
  @IBOutlet weak var endDatePicker: UIDatePicker!
  
  @IBOutlet weak var startDateLabel: UILabel!
  @IBOutlet weak var endDateLabel: UILabel!
  
  @IBAction func startDateSelectAction(sender: AnyObject) {
    var currentDate = NSDate()
    selectedStartDate = startDatePicker.date
    var dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MMMM dd YYYY h:mm a"
    var dateString = dateFormatter.stringFromDate(selectedStartDate!)
    self.startDateLabel.text = dateString
    endDatePicker.minimumDate = startDatePicker.date
    
  }
  
  //MARK : IBAction
  
  @IBAction func endDateSelectAction(sender: AnyObject) {
    selectedEndDate = endDatePicker.date
    
    var dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MMMM dd YYYY h:mm a"
    var dateString = dateFormatter.stringFromDate(selectedEndDate!)
    self.endDateLabel.text = dateString
  }
  
  @IBAction func saveDateButtonPressed(sender: AnyObject) {
    if let startDate = selectedStartDate,
      endDate = selectedEndDate{
        self.dateDelegate?.uiPickerAvailableDatesSelected(startDate, endDate : endDate)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    startDatePicker.minimumDate = NSDate()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}