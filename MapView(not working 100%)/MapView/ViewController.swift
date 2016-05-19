//
//  ViewController.swift
//  MapView
//
//  Created by Haitham Slaibi on 5/16/16.
//  Copyright © 2016 Haitham Slaibi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var geoCoder = CLGeocoder()
    
    
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake{
            
            
            //
            //            let annotation = Annotations(coordinate: locationManager.location!.coordinate, title: "Pizza", subtitle: "Yummy")
            //            mapView.addAnnotation(annotation)
            //
            //            geoCoder.reverseGeocodeLocation(locationManager.location!, completionHandler: { (places, error) in
            //                if let places = places?.first{
            //                    print(places.addressDictionary)
            //
            //                }
            //            })
            printMapDirection("Jerusalem")
        }
    }
    
    @IBAction func mapTypeChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0 :
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Satellite
        case 2:
            mapView.mapType = .Hybrid
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLocationManager()
    }
    
    
    func setUpLocationManager(){
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        //locationManager.requestLocation()
        locationManager.desiredAccuracy  = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100.0 // in meters
        
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        mapView.showsBuildings = true
    }
    
    
    
    func openMapDirection(query:String){
        geoCoder.geocodeAddressString(query) { (places, error) in
            let dest = MKPlacemark(placemark: places!.first!)
            let destMapItem = MKMapItem(placemark: dest)
            
            MKMapItem.openMapsWithItems([destMapItem], launchOptions: nil)
            
        }
    }
    
    func printMapDirection(query:String){
        // get the coordinates to go to
        geoCoder.geocodeAddressString(query) { (places, error) in
            let dest = MKPlacemark(placemark: places!.first!)
            let destMapItem = MKMapItem(placemark: dest)
            
            // start map item
            let startItem = MKMapItem.mapItemForCurrentLocation()
            
            let request = MKDirectionsRequest()
            request.source = startItem
            request.destination = destMapItem
            request.transportType = .Automobile
            request.requestsAlternateRoutes = false // if true shows all routs available if false shows only recomendeed one
            
            let directions = MKDirections(request : request)
            directions.calculateDirectionsWithCompletionHandler({ (response, error) in
                
                print(error)
                if let route = response?.routes[0]{
                    for step in route.steps{
                        print (step.instructions)
                    }}
            })
            
            
            //open apple maps to navigate
            // MKMapItem.openMapsWithItems([destMapItem], launchOptions: nil)
            
        }
    }
    
    func addGeoFence(){
        let coordinates = CLLocationCoordinate2D(latitude: 32.0843985, longitude: 34.800728)
        
        let region = CLCircularRegion(center: coordinates, radius: 50, identifier: "HackerU")
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        locationManager.startMonitoringForRegion(region)
        
        let circleOverlay = MKCircle(centerCoordinate: coordinates, radius: 50)
        circleOverlay.title = "HackerU"
        
        mapView.addOverlay(circleOverlay)
    }
    
    
}









extension ViewController:CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print ("entered reigion")
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("exited region")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coords = locations[0].coordinate
        
        
        geoCoder.reverseGeocodeLocation(locationManager.location!) { (places, error) in
            if let place = places?.first, let city =  place.addressDictionary?["City"] as? String , let name = place.addressDictionary?["Name"] as? String {
                let annotation = Annotations(coordinate: coords, title: "\(city)" , subtitle: "\(name)")
                self.mapView.addAnnotation(annotation)
            }
        }
        
        let region = MKCoordinateRegionMakeWithDistance(coords, 100, 100)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print (error)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways{
            //print("yay")
        }
        else if status == .Denied || status == .NotDetermined{
            //print ("No Permission yet")
        }
    }
    
    func addPolyLineOverlay(){
        var points = [CLLocationCoordinate2D]()
        
        points.append(CLLocationCoordinate2D(latitude: 32.0846632, longitude: 34.7987813))
        points.append(CLLocationCoordinate2D(latitude: 32.084390, longitude: 34.7987813))
        points.append(CLLocationCoordinate2D(latitude: 32.0846632, longitude: 34.7987813))
        
        
    }
    
}




extension ViewController :MKMapViewDelegate{
    
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay.title! == "HackerU"{
            let circleOverlay = MKCircleRenderer(overlay: overlay)
            circleOverlay.strokeColor = UIColor.redColor().colorWithAlphaComponent(0.5)
            circleOverlay.lineWidth = 0.5
        
        }
        
        
        let polyRenderer = MKPolylineRenderer(overlay: overlay)
        polyRenderer.strokeColor = UIColor.orangeColor()
        polyRenderer.lineWidth = 5.0
        
        return polyRenderer
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKindOfClass(Annotations) { //&& annotation.title ?? "" == "Pizza"{
            //let view = MKAnnotationView() for pictures
            let view = MKPinAnnotationView()
            view.annotation = annotation
            
            //view.pinTintColor = UIColor.purpleColor()
            
            view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
            view.canShowCallout = true
            
            //view.image = UIImage(named: "pizza")
            
            return view
        }
        return nil
        
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        dispatch_async(dispatch_get_main_queue()) {
            let url = NSURL(string: "tel://\(0522926807)")
            if UIApplication.sharedApplication().canOpenURL(url!)
            {
                print("called")
                UIApplication.sharedApplication().openURL(url!)
            }
        }
    }
}




