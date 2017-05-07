//
//  HomeViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 4/22/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit
import CoreImage
import CoreLocation

class HomeViewController: UIViewController,CLLocationManagerDelegate {
    
    var dice = true
    var PaymentMethod = "PrePaid"
    var locationManager: CLLocationManager!

    
    @IBOutlet weak var InfoBoardView: UIView!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var BalanceLabel: UILabel!
    
    @IBOutlet weak var NextTripLabel: UILabel!
    @IBOutlet weak var SuggestionParking: UILabel!
    @IBOutlet weak var StartPlaceLabel: UILabel!
    @IBOutlet weak var ArrivePlaceLabel: UILabel!
    
    @IBOutlet weak var ticketView: UIView!
    @IBOutlet weak var TicketImageView: UIImageView!
    @IBOutlet weak var QRCodeImageView: UIImageView!
    
    @IBAction func MenuClicked(_ sender: UIButton) {

    }
    
    @IBAction func notificationClicked(_ sender: UIButton) {
        if dice == true {
            dice = false
            generateQRCode("neknil")
            return
        }else{
            dice = true
        }
        
        generateQRCode("linken")
    }
    
    
    
    @IBAction func PrintCodeClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func InfoClicked(_ sender: UIButton) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getUserLocation()

        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    

}
extension HomeViewController{
    func generateQRCode(_ code: String) {
        let text = code
        let data = text.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)

        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        if let qrcodeImage = filter?.outputImage{
            let scaleX = QRCodeImageView.frame.size.width / qrcodeImage.extent.size.width
            let scaleY = QRCodeImageView.frame.size.height / qrcodeImage.extent.size.height
            
            let transformedImage = qrcodeImage.applying(CGAffineTransform(scaleX: scaleX, y: scaleY))
            QRCodeImageView.image = UIImage(ciImage: transformedImage)
        }
    }
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        User.currentUser.location = locationManager.location?.coordinate
    }
    func initView() {

        TicketImageView.image = UIImage(named: "Ticket.png")
        ticketView.clipsToBounds = true
        ticketView.layer.cornerRadius = 20
        InfoBoardView.layer.cornerRadius = 10
        InfoBoardView.clipsToBounds = true
        
        generateQRCode("abcd")
        
        UsernameLabel.text = "Le Minh"
        BalanceLabel.text = "30.000"
        NextTripLabel.text = "Bitexco"
        SuggestionParking.text = "43 Nguyen Hue"
        StartPlaceLabel.text = "Home"
        ArrivePlaceLabel.text = "Bitexco"
        
    }
}
