//
//  thirdViewController.swift
//  EcoPatrol
//
//  Created by Scholar on 8/4/21.
//

import UIKit
import MapKit
import CoreLocation

class thirdViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        
        //experimental code
        let firstAnnotation = MKPointAnnotation()
        firstAnnotation.coordinate = CLLocationCoordinate2D(latitude: 37.78995, longitude: -122.40)
        firstAnnotation.title = "Purple Loosestrife"
        mapView.addAnnotation(firstAnnotation)
        
        let secondAnnotation = MKPointAnnotation()
        secondAnnotation.coordinate = CLLocationCoordinate2D(latitude:37.7906, longitude: -122.4065)
        secondAnnotation.title = "Kudzu"
        mapView.addAnnotation(secondAnnotation)
        
        let thirdAnnotation = MKPointAnnotation()
        thirdAnnotation.coordinate = CLLocationCoordinate2D( latitude: 37.7882, longitude: -122.4031)
        thirdAnnotation.title = "Japanese Barberry"
        mapView.addAnnotation(thirdAnnotation)
        
    }
    
  
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            locationManagerDidChangeAuthorization(locationManager)
        } else  {
            //Show alert letting the user know they have to turn this on.
        }
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
       
        @unknown default:
            fatalError()
        }
    }
}

extension thirdViewController: CLLocationManagerDelegate {
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManagerDidChangeAuthorization(locationManager)
    }
}
