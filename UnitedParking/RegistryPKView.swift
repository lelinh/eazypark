//
//  RegistryPKView.swift
//  UnitedParking
//
//  Created by Linh Le on 5/4/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

@IBDesignable


class RegistryPKView: UIView,CLLocationManagerDelegate{

    var locationManager: CLLocationManager!

    @IBOutlet weak var OwnerTextField: UITextField!
    @IBOutlet weak var AddressTexField: UITextField!
    
    @IBOutlet weak var MapView: GMSMapView!
    
    var contentView : UIView?
    var currentLocation:CLLocationCoordinate2D!
    
    
    @IBAction func GetYourLocationButtonClicked(_ sender: UIButton) {
        getUserLocation()
        setupMapView()
    }
    
    @IBAction func SubmitButtonClicked(_ sender: UIButton) {
        print("submit")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView!.frame = bounds
        
        // Make the view stretch with containing view
        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    // You don't need to modify the default init(nibName:bundle:) method.
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        User.currentUser.location = locationManager.location?.coordinate
    }
    
    func setupMapView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 12.
        let camera = GMSCameraPosition.camera(withLatitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude, zoom: 14.0)
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.205, zoom: 16.0)
        
        MapView.camera = camera
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude)
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.205)
        marker.title = AddressTexField.text ?? "Sydney"
        marker.snippet = "Australia"
        marker.map = MapView
    }

}
