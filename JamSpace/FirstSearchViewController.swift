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
  
  func searchForCity(text: UITextField){
    //send city name to Parse
    performSegueWithIdentifier("showListMapVC", sender: nil)
   // dismissViewControllerAnimated(true, completion: <#(() -> Void)?##() -> Void#>)
  }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "showListMapVC" {
        let listMapSearchViewController = segue.destinationViewController as! ListMapSearchViewController
        listMapSearchViewController.passedCity = searchTextField.text 
      }
    }

}

extension FirstSearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    cityToSearch = searchTextField.text
    searchTextField.resignFirstResponder()
    println(cityToSearch)
    dismissViewControllerAnimated(true, completion: nil)
    return true
  }
}
