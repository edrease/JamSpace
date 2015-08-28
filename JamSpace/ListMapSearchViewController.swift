//
//  ListSearchViewController.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import MapKit

class ListMapSearchViewController: UIViewController {
  
  var arrayOfPracticeSpaces = [PracticeSpace]()
  
  var mapViewController: MapViewController!
  var listViewController: ListViewController!
  var currentViewController : UIViewController?
  
  //toggles between list child vc and map child vc
  @IBAction func toggleSegment(sender: UISegmentedControl) {
    switchToViewController()
  }
  
  @IBOutlet weak var listOrMap: UISegmentedControl!
  @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

      
      mapViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
      listViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ListViewController") as! ListViewController
      listViewController.passedArrayOfPracticeSpaces = arrayOfPracticeSpaces
      mapViewController.passedArrayOfPracticeSpaces = arrayOfPracticeSpaces
      
      switchToViewController()
      
        // Do any additional setup after loading the view.
      var filterButton : UIBarButtonItem = UIBarButtonItem(title: "Filter", style: UIBarButtonItemStyle.Plain, target: self, action: "sendToFilter")

      self.navigationItem.rightBarButtonItem = filterButton
      

    }
  
  override func viewWillAppear(animated: Bool) {
    println("filtered array passed back!")
    println(arrayOfPracticeSpaces.count)
    listViewController.passedArrayOfPracticeSpaces = arrayOfPracticeSpaces
    
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func switchToViewController() {
    
    if let currentViewController = currentViewController {
      currentViewController.removeFromParentViewController()
      currentViewController.view.removeFromSuperview()
      currentViewController.didMoveToParentViewController(nil)
    }
    
    currentViewController = listOrMap.selectedSegmentIndex == 0 ? listViewController : mapViewController
    
    self.addChildViewController(currentViewController!)
    currentViewController!.view.frame = containerView.frame
    currentViewController!.view.frame.origin = CGPointZero
    containerView.addSubview(currentViewController!.view)
    currentViewController?.didMoveToParentViewController(self)
    
    //animate between two views?
 
  }
    

  
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      if segue.identifier == "showFilterView" {
        if let filterSearchTableViewController = segue.destinationViewController as? FilterSearchTableViewController {
        filterSearchTableViewController.delegate = self
        filterSearchTableViewController.passedSpacesArray = arrayOfPracticeSpaces
        }
      }
    }
}


//MARK: UITableViewDelegate
extension ListMapSearchViewController: UITableViewDelegate {
  func sendToFilter(){
    self.performSegueWithIdentifier("showFilterView", sender: nil)
  }
}

//MARK: -
extension ListMapSearchViewController: FilteredArrayDelegate {
  func arrayWasFiltered(filteredArray: [PracticeSpace]){
    arrayOfPracticeSpaces = filteredArray
    for space in arrayOfPracticeSpaces {
      println("Filtered array passed: \(space.nameOfSpace)")
    }
  }
}
