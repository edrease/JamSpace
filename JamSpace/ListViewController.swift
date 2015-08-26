//
//  ListViewController.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/25/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
  var arrayOfPracticeSpaces = [PracticeSpace]()

  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//      if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
//        arrayOfPracticeSpaces = appDelegate.dummySpacesArray
//      }
      
      
      if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
        arrayOfPracticeSpaces = appDelegate.dummySpacesArray
      }

      
            let cellWidth = tableView.frame.size.width
            tableView.rowHeight = (0.75) * cellWidth
            //tableView.rowHeight = UITableViewAutomaticDimension
            tableView.registerNib(UINib(nibName: "PracticeSpaceCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "PracticeSpaceCell")
      
            tableView.dataSource = self
            //tableView.delegate = self
   
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

//MARK: -
extension ListViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return arrayOfPracticeSpaces.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PracticeSpaceCell", forIndexPath: indexPath) as! PracticeSpaceCell
    cell.cellImageView.image = arrayOfPracticeSpaces[indexPath.row].imageFolder[0]
    cell.cellPrice.text = "$\(arrayOfPracticeSpaces[indexPath.row].pricePerDay.description)"
    cell.spaceSummaryLabel.text = "Practice space in \(arrayOfPracticeSpaces[indexPath.row].city)"
    
    return cell
  }
  
}

//MARK: UITableViewDelegate
extension ListViewController: UITableViewDelegate {
  func sendToFilter(){
    self.performSegueWithIdentifier("showFilterView", sender: nil)
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return (0.75) * view.frame.width
  }
}

