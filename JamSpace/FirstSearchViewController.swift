//
//  FirstSearchViewController.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/26/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

class FirstSearchViewController: UIViewController {
  
  @IBOutlet weak var searchTextField: UITextField!
  
  var cityToSearch: String!
  var searchResults: [PracticeSpace]!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      searchTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "showListMapVC" {
        let listMapSearchViewController = segue.destinationViewController as! ListMapSearchViewController
        listMapSearchViewController.arrayOfPracticeSpaces = searchResults
      }
    }

}

extension FirstSearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    cityToSearch = searchTextField.text
    searchTextField.resignFirstResponder()
    println(cityToSearch)
    dismissViewControllerAnimated(true, completion: nil)
    LocationSearchService.locationsForSearchTerm(textField.text, completionHandler: { (error, practiceSpaces) -> (Void) in
      if let practiceSpaces = practiceSpaces {
        self.searchResults = practiceSpaces
      }
      
      self.performSegueWithIdentifier("showListMapVC", sender: nil)
    })

    return true
  }
}
