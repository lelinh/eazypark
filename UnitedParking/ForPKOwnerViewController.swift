//
//  ForPKOwnerViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 5/3/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class ForPKOwnerViewController: UIViewController {

    @IBOutlet weak var ContentViewHeighConstrant: NSLayoutConstraint!
    
    @IBOutlet weak var RegistryView: RegistryPKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ContentViewHeighConstrant.constant = RegistryView.frame.height + 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func prepareData() {

    }
}
