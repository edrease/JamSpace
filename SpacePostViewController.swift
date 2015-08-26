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
	@IBOutlet weak var postStartDate: UITextField!
	@IBOutlet weak var postEndDate: UITextField!
	@IBOutlet weak var spaceSize: UITextField!
	
	@IBOutlet weak var startTime: UITextField!
	@IBOutlet weak var endTime: UITextField!
	
	
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
		
		var practiceSpaces = PFObject(className: "PracticeSpaces")
		practiceSpaces["nameOfSpace"] = postTitle.text
		practiceSpaces["description"] = postSummary.text
		practiceSpaces["openingHour"] = startTime.text
		practiceSpaces["closingHour"] = endTime.text
		practiceSpaces["startDate"] = postStartDate.text
		practiceSpaces["endDate"] = postEndDate.text
		practiceSpaces["pricePerDay"] = postEndDate.text.toInt()
		practiceSpaces["sizeInFeet"] = spaceSize.text.toInt()
		practiceSpaces["streetAddress"] = postStreetAddress.text
		practiceSpaces["state"] = postState.text
		practiceSpaces["zipCode"] = postZipCode.text
		practiceSpaces.save()
		
		
//		var user = PFUser.currentUser()
//		var relation = user?.relationForKey("listings")
//		relation?.addObject(practiceSpaces)
//		user?.saveInBackgroundWithBlock({ (success:Bool, error : NSError?) -> Void in
//			if (success){
//				println("It was uploaded")
//			}
//			else{
//				println("Total Fail")
//				println(user)
//			}
//		})
		
//		var user = PFUser.currentUser()
//		var relation = user.relationForKey("likes")
//		relation.addObject(post)
//		user.saveInBackgroundWithBlock {
//			(success: Bool, error: NSError?) -> Void in
//			if (success) {
//    // The post has been added to the user's likes relation.
//			} else {
//    // There was a problem, check error.description
//			}
//		}
		
		
		//create the relation between practiceSpaces here
		// instantiate a user property
		// a PFRelation object with relation key "listings" then add the practice Spaces to this object
		

		
		
	}
	
	@IBAction func resetButtonPressed(sender: AnyObject) {
		// Set all IBOutlets to nill
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

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
