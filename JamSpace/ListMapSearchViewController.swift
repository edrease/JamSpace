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
  
  @IBAction func toggleSegment(sender: UISegmentedControl) {
    switchToViewController()
  }
  
  @IBOutlet weak var listOrMap: UISegmentedControl!
  @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
        arrayOfPracticeSpaces = appDelegate.dummySpacesArray
      }
      
      mapViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
      listViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ListViewController") as! ListViewController
      switchToViewController()
      
        // Do any additional setup after loading the view.
      var filterButton : UIBarButtonItem = UIBarButtonItem(title: "Filter", style: UIBarButtonItemStyle.Plain, target: self, action: "sendToFilter")

      self.navigationItem.rightBarButtonItem = filterButton
      
      //filterButton.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
      
      //title = ""
      
      
      
//      let cellWidth = tableView.frame.size.width
//      tableView.rowHeight = (0.75) * cellWidth
//      //tableView.rowHeight = UITableViewAutomaticDimension
//      tableView.registerNib(UINib(nibName: "PracticeSpaceCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "PracticeSpaceCell")
//      
//      tableView.dataSource = self
//      tableView.delegate = self
      
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      if segue.identifier == "showFilterView" {
        if segue.identifier == "showFilterView" {
          let filterSearchTableViewController = segue.destinationViewController as! FilterSearchTableViewController
          filterSearchTableViewController.passedSpacesArray = arrayOfPracticeSpaces
        }
      }
    }
}

//MARK: -
extension ListMapSearchViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return arrayOfPracticeSpaces.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PracticeSpaceCell", forIndexPath: indexPath) as! PracticeSpaceCell
    cell.cellImageView.image = arrayOfPracticeSpaces[indexPath.row].imageFolder[0]
    cell.cellPrice.text = "$\(arrayOfPracticeSpaces[indexPath.row].pricePerDay.description)"
    
    
    return cell
  }
  
}

////MARK: UITableViewDelegate
//extension ListMapSearchViewController: UITableViewDelegate {
//  func sendToFilter(){
//    self.performSegueWithIdentifier("showFilterView", sender: nil)
//  }
//  
//  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//    return (0.75) * view.frame.width
//  }
//}
