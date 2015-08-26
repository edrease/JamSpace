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
	@IBOutlet weak var pastStartDate: UITextField!
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
		
		//grab current User from PFuser object
//		var gameScore = PFObject(className:"GameScore")
//		gameScore["score"] = 1337
//		gameScore["playerName"] = "Sean Plott"
//		gameScore["cheatMode"] = false
//		gameScore.saveInBackgroundWithBlock {
//			(success: Bool, error: NSError?) -> Void in
//			if (success) {
//    // The object has been saved.
//			} else {
//    // There was a problem, check error.description
//			}
//		}
		
		//PracticeSpaces
		

		
		
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
