//
//  ForPKOwnerViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 5/3/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class ForPKOwnerViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var ContentViewHeighConstrant: NSLayoutConstraint!
    
    @IBOutlet weak var RegistryView: RegistryPKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ContentViewHeighConstrant.constant = RegistryView.frame.height + 100
        
        RegistryView.OwnerTextField.delegate = self
        RegistryView.AddressTexField.delegate = self
        
        RegistryView.MotoFeeTextField.delegate = self
        RegistryView.MotoCapacityTextField.delegate = self
        
        RegistryView.CarCapacityTextField.delegate = self
        RegistryView.CarFeeTextField.delegate = self
        RegistryView.CarFeeOvernightPerMonthTextField.delegate = self
        RegistryView.CarFeeOvernightPerNightTextField.delegate = self
        
        RegistryView.OwnerTextField.delegate = self
        RegistryView.OwnerTextField.delegate = self
        
        
        //Add Edge Pan Recognize
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapRegconize))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func prepareData() {

    }
    func tapRegconize(_ sender: UITapGestureRecognizer) {
        RegistryView.OwnerTextField.endEditing(true)
        RegistryView.AddressTexField.endEditing(true)
        
        RegistryView.MotoFeeTextField.endEditing(true)
        RegistryView.MotoCapacityTextField.endEditing(true)
        
        RegistryView.CarCapacityTextField.endEditing(true)
        RegistryView.CarFeeTextField.endEditing(true)
        RegistryView.CarFeeOvernightPerMonthTextField.endEditing(true)
        RegistryView.CarFeeOvernightPerNightTextField.endEditing(true)
        
        RegistryView.OwnerTextField.endEditing(true)
        RegistryView.OwnerTextField.endEditing(true)
    }
}

extension ForPKOwnerViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
}
