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
        
        guard let locationValue: CLLocationCoordinate2D = (manager.location?.coordinate) else { return }
        
        localEventsView.mapView.setRegion(MKCoordinateRegionMakeWithDistance(validLocation.coordinate, 500.0, 500.0), animated: true)
        
        let dndGame = Capital(title: "Pathfinder, 5e Game", coordinate: locationValue, info: "DND")
        
        localEventsView.mapView.addAnnotation(dndGame)
        
//        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
//        
//        mapView.addAnnotations([london, oslo, paris, rome, washington])
        
//        let pinAnnotation: MKPointAnnotation = MKPointAnnotation()
//        pinAnnotation.title = "Pathfinder, 5e Game"
//        pinAnnotation.coordinate = validLocation.coordinate
//        pinAnnotation.subtitle = "DND"
//        let btn = UIButton(type: .detailDisclosure)
//        pinAnnotation.rightCalloutAccessoryView = btn
        
        //localEventsView.mapView.addAnnotation(pinAnnotation)
        
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Capital"
        
        if annotation is Capital {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                let btn = UIButton(type: .detailDisclosure)
                annotationView!.rightCalloutAccessoryView = btn
            } else {
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let capital = view.annotation as! Capital
        let placeName = capital.title
        let placeInfo = capital.info
        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
        let vc = EventViewController()
        present(vc, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    
}
