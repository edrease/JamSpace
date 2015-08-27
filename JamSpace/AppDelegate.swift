//
//  AppDelegate.swift
//  JamSpace
//
//  Created by Edrease Peshtaz on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseUI
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

  var window: UIWindow?
  let locationManager = CLLocationManager()
  var currentSpacesArray = [PracticeSpace]()


  var dummyUsersArray = [User]()
  var dummySpacesArray = [PracticeSpace]()
  
  func loadDummyUsersArray(){
    let user1 = User(firstName: "Tom", lastName: "Callahan", favorites: nil)
    dummyUsersArray.append(user1)
    let user2 = User(firstName: "Julie", lastName: "Black", favorites: nil)
    dummyUsersArray.append(user2)
  }
  
  func loadDummySpacesArray(){
    let tomsBasement = UIImage(named: "basement")
    var tomsImageFolder = [UIImage]()
    tomsImageFolder.append(tomsBasement!)
    
//    let test = PracticeSpace()
//    test.nameOfSpace = "Karate Dojo"
//    test.zipcode = 98121
//    test.streetAddress = "123 Dragon Way"
//    //test.nameOfSpace = "Daniel-Son's Carwash"
//    test.sizeInFeet = 1000
//    test.pricePerDay = 0
//    test.isBasement = false
//    test.isRoom = true
//    test.isGarage = true
//    test.isStudio = false
//    test.imageFolder = nil
//    
//    test.saveInBackground() 
//    let space1 = PracticeSpace(city: "Chicago", zipcode: 38001, streetAddress: "532 Rogers Park West", nameOfSpace: "Tom's Basement", sizeInFeet: 332, pricePerDay: 88, isBasement: true, isRoom: false, isGarage: false, isStudio: false, imageFolder: tomsImageFolder)
//    dummySpacesArray.append(space1)
//    let juliesLivingRoom = UIImage(named: "room")
//    var juliesImageFolder = [UIImage]()
//    juliesImageFolder.append(juliesLivingRoom!)
//    let space2 = PracticeSpace(city: "Chicago", zipcode: 38002, streetAddress: "1253 Lake Shore Drive #32B", nameOfSpace: "Julie's Living Room", sizeInFeet: 62, pricePerDay: 105, isBasement: true, isRoom: false, isGarage: false, isStudio: false,imageFolder: juliesImageFolder)
//    dummySpacesArray.append(space2)
//    let joesGarage = UIImage(named: "garage")
//    var joesImageFolder = [UIImage]()
//    joesImageFolder.append(joesGarage!)
//    let space3 = PracticeSpace(city: "Chicago", zipcode: 38022, streetAddress: "2233 Lake Shore Drive #43C", nameOfSpace: "Joe's Garage", sizeInFeet: 882, pricePerDay: 45, isBasement: true, isRoom: false, isGarage: false, isStudio: false,imageFolder: joesImageFolder)
//    dummySpacesArray.append(space3)
//    let susansStudio = UIImage(named: "studio")
//    var susansImageFolder = [UIImage]()
//    susansImageFolder.append(susansStudio!)
//    let space4 = PracticeSpace(city: "Chicago", zipcode: 38022, streetAddress: "2233 Lake Shore Drive #45D", nameOfSpace: "Susan's Studio", sizeInFeet: 200, pricePerDay: 175, isBasement: true, isRoom: false, isGarage: false, isStudio: false,imageFolder: susansImageFolder)
//    dummySpacesArray.append(space4)
  }
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    Parse.setApplicationId(kApplicationID,
      clientKey: kClientKey)
    
        let jamUser = PFUser.currentUser()?.username
      PracticeSpace.registerSubclass()
    
        if (jamUser != nil) {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
//          let initialView = storyboard.instantiateViewControllerWithIdentifier("initialView") as! UITabBarController
					
					 let initialView = storyboard.instantiateViewControllerWithIdentifier("spacePostView") as! SpacePostViewController
    
          self.window?.rootViewController = initialView
    
        } else {
    
    
    }
    
//    locationManager.delegate = self                
//    locationManager.requestAlwaysAuthorization()


    return true
  }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

