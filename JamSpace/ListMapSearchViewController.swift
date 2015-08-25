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
  
  
  
  @IBAction func toggleSegment(sender: UISegmentedControl) {
    switch listOrMap.selectedSegmentIndex
    {
    case 0:
      tableView.hidden = false
      mapView.hidden = true
    case 1:
      tableView.hidden = true
      mapView.hidden = false
    default:
      break;
    }
  }
  
  @IBOutlet weak var listOrMap: UISegmentedControl!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      var filterButton : UIBarButtonItem = UIBarButtonItem(title: "Filter", style: UIBarButtonItemStyle.Plain, target: self, action: "sendToFilter")

      self.navigationItem.rightBarButtonItem = filterButton
      
      //filterButton.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
      
      //title = ""
      
      if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
        arrayOfPracticeSpaces = appDelegate.dummySpacesArray
      }
      
      for thing in arrayOfPracticeSpaces {
        println(thing.nameOfSpace)
      }
      
      tableView.estimatedRowHeight = 76
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.registerNib(UINib(nibName: "PracticeSpaceCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "PracticeSpaceCell")
      
      tableView.dataSource = self
      tableView.delegate = self
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      if segue.identifier == "showFilterView" {
//        let filterSearchViewController = segue.destinationTableViewController as! FilterSearchTableViewController
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
    cell.cellPrice.text = arrayOfPracticeSpaces[indexPath.row].pricePerDay.description
    cell.favoriteButton.backgroundColor = UIColor.redColor()
    
    return cell
  }
  
}

//MARK: UITableViewDelegate
extension ListMapSearchViewController: UITableViewDelegate {
  func sendToFilter(){
    self.performSegueWithIdentifier("showFilterView", sender: nil)
  }
}
