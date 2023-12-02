//
//  ViewController.swift
//  mapkit-corelocation
//
//  Created by peppermint100 on 12/1/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let map = MKMapView()
    fileprivate let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } 
        else {
            print("locationServices disenabled")
        }
    }
    
    override func viewDidLayoutSubviews() {
        map.frame = view.bounds
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocation")
        let lat = locationManager.location!.coordinate.latitude
        let lng = locationManager.location!.coordinate.longitude
        print(lat, lng)
        let currentLocation = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let defaultSpanValue = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: currentLocation, span: defaultSpanValue)
        map.setRegion(region, animated: true)
        let circle = MKCircle(center: currentLocation, radius: 20)
        map.addOverlay(circle)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let circleOverlay = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(circle: circleOverlay)
            circleRenderer.strokeColor = UIColor.blue
            circleRenderer.fillColor = UIColor.blue.withAlphaComponent(0.3)
            circleRenderer.lineWidth = 2
            return circleRenderer
        }
        return MKOverlayRenderer()
    }
}

