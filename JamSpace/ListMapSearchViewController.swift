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
      var filterButton : UIBarButtonItem = UIBarButtonItem(title: "Filter", style: UIBarButtonItemStyle.Plain, target: self, action: "")

      self.navigationItem.rightBarButtonItem = filterButton
      
      //title = ""
      
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
    }
}
