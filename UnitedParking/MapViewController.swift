//
//  MapViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 4/25/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var MapView: GMSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupMapView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // You don't need to modify the default init(nibName:bundle:) method.
    
    func setupMapView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level xx.
        User.currentUser.getUserLocation()
        let camera = GMSCameraPosition.camera(withLatitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude, zoom: 16.0)
        
        MapView.camera = camera
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = MapView
    }

}
