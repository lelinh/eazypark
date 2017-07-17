//
//  UserDetailsViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 5/11/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var UserID = "alibaba"
    
    @IBOutlet weak var UserIDLabel: UILabel!
    
    @IBAction func CheckInClicked(_ sender: UIButton) {
        print("\(UserID) Checked in!!")
        UserIDLabel.text = UserID
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UserIDLabel.text = UserID
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
