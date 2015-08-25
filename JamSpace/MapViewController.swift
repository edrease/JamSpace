//
//  MapViewController.swift
//  JamSpace
//
//  Created by Joao Paulo Galvao Alves on 8/24/15.
//  Copyright (c) 2015 cf. All rights reserved.
//

import UIKit
import MapKit
import Parse

class MapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
  
  //MARK: - Outlets
  @IBOutlet weak var mapView: MKMapView!
  
  var currentLoc: PFGeoPoint! = PFGeoPoint()
  var coreLocationManager = CLLocationManager()
  var locationManager : LocationManager!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.mapView.delegate = self
    
    
    // Do any additional setup after loading the view.
    coreLocationManager.delegate = self
    
    locationManager = LocationManager.sharedInstance
    
    let authorizationCode = CLLocationManager.authorizationStatus()
    
    if authorizationCode == CLAuthorizationStatus.NotDetermined && coreLocationManager.respondsToSelector("requestAlwaysAuthorization") || coreLocationManager.respondsToSelector("requestWhenInUseAuthorization") {
      
      if NSBundle.mainBundle().objectForInfoDictionaryKey("NSLocationAlwaysUsageDescription") != nil {
        coreLocationManager.requestAlwaysAuthorization()
      } else {
        println("No description provided")
      }
      
    } else {
      
      getLocation()
      fetchLocationFromParse()
      
    }
    
    //Request User permission
    //mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
    
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func getLocation() {
    
      locationManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) -> () in
        self.displatyLocation(CLLocation(latitude:latitude, longitude: longitude))
    }
    
  }
  
  func displatyLocation(location: CLLocation) {
    
    mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), span: MKCoordinateSpanMake(0.05, 0.05)), animated: true)
    
    let locationPinCoord = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = locationPinCoord
    
    mapView.addAnnotation(annotation)
    mapView.showAnnotations([annotation], animated: true)
  }
  
  func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    if status != CLAuthorizationStatus.NotDetermined || status != CLAuthorizationStatus.Denied || status != CLAuthorizationStatus.Restricted {
      getLocation()
    }
  }
  
  
  func fetchLocationFromParse (){
    var annotationQuery = PFQuery(className: "PracticeSpaces")
    currentLoc = PFGeoPoint(location: coreLocationManager.location)
    annotationQuery.whereKey("spaceLocation", nearGeoPoint: currentLoc, withinMiles: 10)
    
    annotationQuery.findObjectsInBackgroundWithBlock {
      (posts, error) -> Void in
      if error == nil {
        // The find succeeded.
        println("Successful query for annotations")
        let myPosts = posts as! [PFObject]
        for post in myPosts {
          let point = post["spaceLocation"] as! PFGeoPoint
          let annotation = MKPointAnnotation()
          annotation.coordinate = CLLocationCoordinate2DMake(point.latitude, point.longitude)
          self.mapView.addAnnotation(annotation)
        }
      } else {
        // Error
        println("Error: \(error)")
      }
    }
    
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
