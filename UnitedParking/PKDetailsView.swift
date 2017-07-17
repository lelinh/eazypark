//
//  PKDetailsView.swift
//  UnitedParking
//
//  Created by Linh Le on 5/13/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

@IBDesignable

class PKDetailsView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var number = "0984684922"
    var contentView: UIView!
    
    
    @IBOutlet weak var AvatarImageView: UIImageView!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var MapView: GMSMapView!
    @IBOutlet weak var MotoFeeLabel: UILabel!
    @IBOutlet weak var CarFeeLabel: UILabel!
    @IBOutlet weak var MotoOver9FeeLabel: UILabel!
    @IBOutlet weak var CarOver9FeeLabel: UILabel!
    @IBOutlet weak var InfoLabel: UILabel!
    
    @IBAction func CallButtonClicked(_ sender: UIButton) {
        print("call 098...")
        guard let number = URL(string: "telprompt://" + number) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
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
    func setupMapView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 12.
        let camera = GMSCameraPosition.camera(withLatitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude, zoom: 14.0)
        
        MapView.camera = camera
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude)
        marker.title = AddressLabel.text ?? "Sydney"
        marker.snippet = "Australia"
        marker.map = MapView
        MapView.delegate = self
    }

}
extension PKDetailsView:GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let camera = GMSCameraPosition.camera(withLatitude: User.currentUser.location.latitude, longitude: User.currentUser.location.longitude, zoom: 1.0)
        
        MapView.camera = camera
    }
}
