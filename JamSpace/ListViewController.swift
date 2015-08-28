//
//  ListViewController.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/25/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
  var passedArrayOfPracticeSpaces = [PracticeSpace]()
  var spaceToPass: PracticeSpace!
  var tempArrayOfImages = [UIImage]()
  var imageToPass: UIImage!
  
  @IBOutlet weak var tableView: UITableView!
  //weak var delegate: FilteredArrayDelegate?
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    spaceToPass = passedArrayOfPracticeSpaces[indexPath.row]
    imageToPass = tempArrayOfImages[indexPath.row]
    performSegueWithIdentifier("showSpaceDetailVC", sender: nil)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //self.tableView.separ
      
            let cellWidth = tableView.frame.size.width
            //tableView.rowHeight = (0.75) * cellWidth
      //magic number height until image parsed and load func in place
      tableView.estimatedRowHeight = 240
            //tableView.rowHeight = 240
            tableView.registerNib(UINib(nibName: "PracticeSpaceCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "PracticeSpaceCell")
      
            tableView.dataSource = self
            tableView.delegate = self
    }
  
  override func viewWillAppear(animated: Bool) {
    println(passedArrayOfPracticeSpaces.count)
    tableView.reloadData()
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
      if segue.identifier == "showSpaceDetailVC" {
        let spaceDetailVC = segue.destinationViewController as! SpaceDetailViewController
        spaceDetailVC.passedSpaceListing = spaceToPass
        spaceDetailVC.passedSpaceImage = imageToPass
      }
    }
}

//MARK: -
extension ListViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return passedArrayOfPracticeSpaces.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PracticeSpaceCell", forIndexPath: indexPath) as! PracticeSpaceCell
    
    cell.tag++
    let tag = cell.tag
    
    let imageFile = passedArrayOfPracticeSpaces[indexPath.row].tempImage
      imageFile.getDataInBackgroundWithBlock({ (data, error) -> Void in
        if let error = error {
          println(error.localizedDescription)
        } else if let data = data,
          image = UIImage(data: data){
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
              //let post = Post(image: image)
              //                      posts.append(post)
              if cell.tag == tag {
                cell.cellImageView.image = image
                self.tempArrayOfImages.append(image)
              }
              //self.tableView.reloadData()
            })
        }
      })
    
    cell.cellPrice.text = "$\(passedArrayOfPracticeSpaces[indexPath.row].pricePerDay.description)"
    cell.headlineLabel.text = passedArrayOfPracticeSpaces[indexPath.row].nameOfSpace
    let city = passedArrayOfPracticeSpaces[indexPath.row].city
    let state = passedArrayOfPracticeSpaces[indexPath.row].state
    cell.cityStateLabel.text = city + ", \(state)"

    return cell
  }

  
}

//MARK: UITableViewDelegate
extension ListViewController: UITableViewDelegate {

}



