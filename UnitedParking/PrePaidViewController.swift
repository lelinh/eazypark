//
//  PrePaidViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 4/30/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class PrePaidViewController: UIViewController {
    
    var user:User!
    
    @IBOutlet weak var CurrencyLabel: UILabel!
    
    @IBOutlet weak var AmountLabel: UILabel!
    

    @IBAction func CloseLabel(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil)
    }
    @IBAction func AddButton(_ sender: UIButton) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension PrePaidViewController{
    func setView() {
        CurrencyLabel.text = "$"
        AmountLabel.text = "3,000"
    }
}

