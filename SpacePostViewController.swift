//
//  SpacePostViewController.swift
//  JamSpace
//
//  Created by Mick Soumphonphakdy on 8/25/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import Parse


class SpacePostViewController: UIViewController {
	
	// MARK: IBOutlets
	
	@IBOutlet weak var postTitle: UITextField!
	@IBOutlet weak var postSummary: UITextView!
	@IBOutlet weak var postPrice: UITextField!
	@IBOutlet weak var postStreetAddress: UITextField!
	@IBOutlet weak var postCity: UITextField!
	@IBOutlet weak var postState: UITextField!
	@IBOutlet weak var postZipCode: UITextField!
	@IBOutlet weak var spaceSize: UITextField!
	
	//Date and Time Outlets/Actions
	@IBOutlet weak var startDateLabelText: UILabel!
	@IBOutlet weak var endDateLabelText: UILabel!
	
	// MARK: IBActions

	@IBAction func postImageButton(sender: AnyObject) {
		//kick off UIImageController and Alert View controller
	}
	
	@IBAction func postSavedButton(sender: AnyObject) {
		//validate text input via REGEX
		//post to parse
		// validate entry of field to ensure all is field out
		// look at input validation
		
		
		//PracticeSpaces
		//instantiate current user
		
		var practiceSpaces = PracticeSpace()
		practiceSpaces["nameOfSpace"] = postTitle.text
		practiceSpaces["description"] = postSummary.text
//		practiceSpaces["openingHour"] = nil
//		practiceSpaces["closingHour"] = nil
//		practiceSpaces["startDate"] = nil
//		practiceSpaces["endDate"] = nil
		practiceSpaces["pricePerDay"] = postPrice.text.toInt()
		practiceSpaces["sizeInFeet"] = spaceSize.text.toInt()
		practiceSpaces["streetAddress"] = postStreetAddress.text
		practiceSpaces["state"] = postState.text
		practiceSpaces["zipCode"] = postZipCode.text.toInt()
//		practiceSpaces.imageFolder = nil
		//practiceSpaces.owner = PFUser.currentUser()!
		practiceSpaces.save()
	}
	
	@IBAction func resetButtonPressed(sender: AnyObject) {
		// Set all IBOutlets to nill
	}
	
	
	override func viewDidLoad() {
			super.viewDidLoad()
		
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "setAvailability"{
			var destinationVC = segue.destinationViewController as? SpaceAvailabilityViewController
			destinationVC?.dateDelegate = self
		}
	}
}

// MARK : SpaceAvailibityViewController Delegate Set Up
extension SpacePostViewController : availableDatesSelectedDelegate{
	func uiPickerAvailableDatesSelected(startDate: NSDate, endDate: NSDate) {
//		<#code#>
	}
}

////MARK: GalleryView Controller Delegate Set Up
//extension ViewController : ImageSelectedDelegate {
//	func controllerDidSelectImage(newImage: UIImage) {
//		displayImage = newImage
//	}
//}

