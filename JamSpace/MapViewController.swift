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
  
  
  //MARK: - Lifecycle methods
  
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
      
      //Do some stuff here...
      
    }
    getLocation()
    fetchLocationFromParse()

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK: - My actions
  
  func getLocation() {
    
      locationManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) -> () in
        self.displatyLocation(CLLocation(latitude:latitude, longitude: longitude))
    }
    
  }
  
  func displatyLocation(location: CLLocation) {
    
    mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), span: MKCoordinateSpanMake(0.05, 0.05)), animated: true)
    
    let locationPinCoord = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    
    locationManager.reverseGeocodeLocationWithCoordinates(location, onReverseGeocodingCompletionHandler: { (reverseGecodeInfo, placemark, error) -> Void in
      println(reverseGecodeInfo)
      let address = reverseGecodeInfo?.objectForKey("formattedAddress") as! String
      
      let annotation = MKPointAnnotation()
      annotation.coordinate = locationPinCoord
      annotation.title = address
      
      self.mapView.addAnnotation(annotation)
      self.mapView.showAnnotations([annotation], animated: true)
      
    })
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
        if let myPosts = posts as? [PFObject] {
          for post in myPosts {
            if let point = post["spaceLocation"] as? PFGeoPoint, let spaceName = post["nameOfSpace"] as? String, let spaceDescript = post["description"] as? String{
              let annotation = MKPointAnnotation()
              annotation.coordinate = CLLocationCoordinate2DMake(point.latitude, point.longitude)
              self.mapView.addAnnotation(annotation)
              annotation.title = spaceName + spaceDescript
            }
          }
        }
      } else {
        // Error
        println("Error: \(error)")
      }
    }
    
  }

  //MARK: - Location Manager Delegate methods
  
  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    
      fetchLocationFromParse()
    
  }
  
  func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    if status != CLAuthorizationStatus.NotDetermined || status != CLAuthorizationStatus.Denied || status != CLAuthorizationStatus.Restricted {
      getLocation()
      //fetchLocationFromParse()
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
