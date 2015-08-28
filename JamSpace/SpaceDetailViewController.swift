//
//  SpaceDetailViewController.swift
//  JamSpace
//
//  Created by Edrease Peshtaz on 8/25/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

class SpaceDetailViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
  
  var passedSpaceListing: PracticeSpace!
  var passedSpaceImage: UIImage!
  
  @IBOutlet weak var photoFrame: UIView!
  

  @IBOutlet weak var spaceListingImageView: UIImageView!
  @IBOutlet weak var nameOfSpaceLabel: UILabel!
  @IBOutlet weak var cityStateLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var hostProfileImage: UIImageView!
  @IBOutlet weak var spaceHostNameLabel: UILabel!
  @IBOutlet weak var spaceDescriptionText: UITextView!
  @IBOutlet weak var spaceDescriptionLabel: UITextView!
  
  @IBOutlet weak var bookThisSpaceButtonPressed: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      println(passedSpaceListing.nameOfSpace)
      cityStateLabel.text = "\(passedSpaceListing.city), \(passedSpaceListing.state)"
      priceLabel.text = "$" + "\(passedSpaceListing.pricePerDay)"
      nameOfSpaceLabel.text = passedSpaceListing.nameOfSpace
      spaceListingImageView.image = passedSpaceImage
     // view.insertSubview(photoFrame, aboveSubview: spaceListingImageView)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
      let bookingConfirmationVC = segue.destinationViewController as! BookingRequestConfirmationViewController
      bookingConfirmationVC.passedImage = passedSpaceImage
      bookingConfirmationVC.passedSpace = passedSpaceListing
    } 
  
  
  

}
