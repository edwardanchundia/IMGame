//
//  LocalEventsViewController.swift
//  ImGame
//
//  Created by Edward Anchundia on 8/2/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import PureLayout

class LocalEventsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var localEventsView: LocalEventsViews!
    
    let locationManager: CLLocationManager = {
        let locMan: CLLocationManager = CLLocationManager()
        locMan.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locMan.distanceFilter = 100.0
        return locMan
    }()
    
    let geocoder: CLGeocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

        localEventsView = LocalEventsViews(frame: CGRect.zero)
        self.view.addSubview(localEventsView)
        
        view.backgroundColor = UIColor.white
        
        localEventsView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        
        locationManager.delegate = self
        localEventsView.mapView.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_flip_to_back"), style: .plain, target: self, action: #selector(popToPrevious))
    }
    
    func popToPrevious() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                print("Authorized")
                //manager.allowsBackgroundLocationUpdates = true
                manager.startUpdatingLocation()
                //manager.startMonitoringSignificantLocationChanges()
            case .denied, .restricted:
                print("Authorization denied or restricted")
            case .notDetermined:
                print("Authorization undetermined")
                locationManager.requestAlwaysAuthorization()
//            default:
//                locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Oh wow, location update")
        guard let validLocation: CLLocation = locations.last else { return }
        
        localEventsView.mapView.setRegion(MKCoordinateRegionMakeWithDistance(validLocation.coordinate, 500.0, 500.0), animated: true)
        
        let pinAnnotation: MKPointAnnotation = MKPointAnnotation()
        pinAnnotation.title = "Hey, Title"
        pinAnnotation.coordinate = validLocation.coordinate
        pinAnnotation.subtitle = "Wassup"
        localEventsView.mapView.addAnnotation(pinAnnotation)
        
        let circleOverlay: MKCircle = MKCircle(center: validLocation.coordinate, radius: 100.0)
        localEventsView.mapView.add(circleOverlay)
        
        geocoder.reverseGeocodeLocation(validLocation) { (placemarks: [CLPlacemark]?, error: Error?) in
            if error != nil {
                dump(error)
            }
            
            guard let validPlaceMark: [CLPlacemark] = placemarks,
                let validPlace: CLPlacemark = validPlaceMark.last else { return }
            
            print(validPlace)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    
}
