//
//  SpacePostViewController.swift
//  JamSpace
//
//  Created by Mick Soumphonphakdy on 8/25/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

class SpacePostViewController: UIViewController {
	
	// MARK: IBOutlets
	
	@IBOutlet weak var postTitle: UITextField!
	@IBOutlet weak var postSummary: UITextView!
	@IBOutlet weak var postPrice: UITextField!
	@IBOutlet weak var postStreetAddress: UITextField!
	@IBOutlet weak var postCity: UITextField!
	@IBOutlet weak var postState: UITextField!
	@IBOutlet weak var postZipCode: UITextField!
	
	
	
	// MARK: IBActions

	@IBAction func postImageButton(sender: AnyObject) {
		//kick off UIImageController
	}
	
	@IBAction func postSavedButton(sender: AnyObject) {
		//validate text input via REGEX
		//post to parse
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
