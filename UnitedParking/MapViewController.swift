//
//  MapViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 4/25/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController,UITextFieldDelegate {
    
    var PKName:String?
    var status = true


    @IBOutlet weak var PKSnapshotViewHeightConstrant: NSLayoutConstraint!
    @IBOutlet weak var PKSnapshotView: UIView!
    @IBOutlet weak var MapView: GMSMapView!
    @IBOutlet weak var LocationButton: UIButton!
    
    @IBOutlet weak var PKNameLabel: UILabel!
    @IBOutlet weak var PKAddressLabel: UILabel!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var PKAvatarImageView: UIImageView!
    @IBOutlet weak var PKStatusLabel: UILabel!
    
    @IBOutlet weak var SearchTextField: UITextField!

    
    @IBAction func UserLocationButtonClicked(_ sender: UIButton) {
        let camera = GMSCameraPosition.camera(withLatitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude, zoom: 15.0)
        
        MapView.camera = camera
    }
    @IBAction func OpenPKDetails(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "OpenPKDetails", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupMapView()
        LocationButton.clipsToBounds = true
        LocationButton.layer.cornerRadius = LocationButton.frame.height/2
        PKSnapshotViewHeightConstrant.constant = 0
        MapView.delegate = self
        SearchTextField.delegate = self
        PKSnapshotView.clipsToBounds = true
        PKSnapshotView.layer.cornerRadius = 20
        PKSnapshotView.backgroundColor = UIColor(red: 189/255, green: 224/255, blue: 218/255, alpha: 1)
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
        let camera = GMSCameraPosition.camera(withLatitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude, zoom: 15.0)
        
        MapView.camera = camera
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = MapView
    }
}
extension MapViewController: GMSMapViewDelegate{


    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("tapped \(String(describing: marker.title))")
        PKNameLabel.text = marker.title
        PKAvatarImageView.image = #imageLiteral(resourceName: "avatar")
        PKAddressLabel.text = "49 Nguyen Dinh Chieu, P.12, Q3"
        RatingLabel.text = "Rating: 4.3"
        
        if status {
            PKStatusLabel.text = "Status: Available"
            PKStatusLabel.textColor = UIColor(red: 26/255, green: 172/255, blue: 125/255, alpha: 1)
            status = false
        }else{
            PKStatusLabel.text = "Status: Full"
            PKStatusLabel.textColor = UIColor(red: 252/255, green: 48/255, blue: 53/255, alpha: 1)
            status = true
        }
        PKSnapshotViewHeightConstrant.constant = 130
        SearchTextField.endEditing(true)
        return true
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        PKSnapshotViewHeightConstrant.constant = 0
        SearchTextField.endEditing(true)
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print(marker.title ?? "xx")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return SearchTextField.resignFirstResponder()
    }

}
