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
      //searchTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
      
      searchTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func searchForCity(city: String){
    //send city name to Parse and pull down array of practice spaces in that city to var searchResults
    
    //while search is taking place, run the wheel of death
    
    //for now, use dummy data from app delegate for user and space arrays
    
    if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
      searchResults = appDelegate.dummySpacesArray
    }
    
    //then, when data has been returned from parse, perform segue below:
    
    performSegueWithIdentifier("showListMapVC", sender: nil)
    
   
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
    
    //trigger search query to parse, return data, segue to next vc with following method:
    searchForCity(cityToSearch)
    return true
  }
}
