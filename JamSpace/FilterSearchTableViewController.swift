//
//  FilterSearchTableViewController.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

class FilterSearchTableViewController: UITableViewController {
  
  var passedSpacesArray = [PracticeSpace]()
  var filteredSpacesArray = [PracticeSpace]()
  
  @IBAction func applyButton(sender: UIButton) {
    
    filteredSpacesArray = []
    let maxPrice = Int(priceSlider.value)
    let minSize = Int(sizeSlider.value)
    
    for space in passedSpacesArray {
      if (space.pricePerDay < maxPrice + 1) && (space.sizeInFeet > minSize - 1) {
        filteredSpacesArray.append(space)
      }
    }
    println("filtered array:")
    for space in filteredSpacesArray {
      println(space.nameOfSpace)
    }
    
  }
  
  
  @IBOutlet weak var searchCityTextField: UITextField!
  @IBOutlet weak var currentMaxPriceLabel: UILabel!
  @IBOutlet weak var priceSlider: UISlider!
  @IBOutlet weak var maxPriceLabel: UILabel!
  @IBOutlet weak var currentMinSizeLabel: UILabel!
  @IBOutlet weak var sizeSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      maxPriceLabel.text = "$" + String(Int(priceSlider.value))
      currentMinSizeLabel.text = String(Int(sizeSlider.value))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//      var filterButton : UIBarButtonItem = UIBarButtonItem(title: "Apply", style: UIBarButtonItemStyle.Plain, target: self, action: "filterThisArray")
//      
//      self.navigationItem.rightBarButtonItem = filterButton
      
      for space in passedSpacesArray {
        println(space.nameOfSpace)
      }
      tableView.dataSource = self
      tableView.delegate = self 
    }
  
  override func viewWillDisappear(animated: Bool) {
    
  }
  
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }

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
    
    }
  

}

extension FilterSearchTableViewController: UITableViewDataSource {
  @IBAction func sliderValueChanged(sender: UISlider) {
    var currentPriceSliderValue = Int(sender.value)
    maxPriceLabel.text = "$" + String(currentPriceSliderValue)
  }
  @IBAction func sizeSliderValueChanged(sender: UISlider) {
    var currentSizeSliderValue = Int(sender.value)
    currentMinSizeLabel.text = String(currentSizeSliderValue)
  }
}

extension FilterSearchTableViewController: UITableViewDelegate {
  func filterThisArray(arrayToFilter: [PracticeSpace]){
//    let maxPrice = Int(priceSlider.value)
//    let minSize = Int(sizeSlider.value)
//    
//    for space in passedSpacesArray {
//      if space.pricePerDay <= maxPrice && space.sizeInFeet >= minSize {
//        filteredSpacesArray.append(space)
//      }
//    }
//    for space in filteredSpacesArray {
//      println(space.nameOfSpace)
//    }
  }
}
