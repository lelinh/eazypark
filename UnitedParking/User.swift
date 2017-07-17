//
//  User.swift
//  UnitedParking
//
//  Created by Linh Le on 4/23/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit
import CoreLocation

class User: NSObject,CLLocationManagerDelegate {

    var username: String?
    var userID: String?
    var status: String?
    var balance: String?
    var paymentMethod: String?
    var creditCard: String?
    var cardBrand: String?
    var QRCode: String?
    var noOfTripThisMonth: String?
    var history: [String:String]?
    var location: CLLocationCoordinate2D!
    var locationManager: CLLocationManager!

    init(_ username: String) {
        self.username = username
    }
    static var currentUser = User("linh le")
    
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        User.currentUser.location = locationManager.location?.coordinate
    }
}

//extension User: CustomStringConvertible{
//    var description: String{
//        print("Username: \(username),balance: \(balance)")
//    }
//}
