//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Adrian Padua on 4/12/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager = CLLocationManager()
        
        print("MapViewController loaded its view.")
    }
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        let showLocButton = UIButton(type: .System)
        showLocButton.setTitle("Show Loc", forState: .Normal)
        showLocButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(showLocButton)
        showLocButton.addTarget(self, action: #selector(MapViewController.showLocButton(_:)), forControlEvents: .TouchUpInside)
        
        let topButtonConstraint = showLocButton.topAnchor.constraintEqualToAnchor(segmentedControl.bottomAnchor, constant: 8)
        let leadingButtonConstraint = showLocButton.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingButtonConstraint = showLocButton.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topButtonConstraint.active = true
        leadingButtonConstraint.active = true
        trailingButtonConstraint.active = true
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    func showLocButton(object: AnyObject) {
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let zoomedInCurrentLocation = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 500, 500)
        mapView.setRegion(zoomedInCurrentLocation, animated: true)
    }
}
