//
//  RequestSentViewController.swift
//  JamSpace
//
//  Created by Matthew McClure on 8/27/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit

class RequestSentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let background = CAGradientLayer().colorFade()
      background.frame = self.view.bounds
      self.view.layer.insertSublayer(background, atIndex: 0)

        // Do any additional setup after loading the view.
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
