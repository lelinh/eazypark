//
//  PKDetailsViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 5/13/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class PKDetailsViewController: UIViewController {

    @IBOutlet weak var ContentView: PKDetailsView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func BackButtonClicked(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ContentView.setupMapView()
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = backButton.frame.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
