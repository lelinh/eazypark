//
//  LoginViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 4/22/17.
//  Copyright © 2017 Linh Le. All rights reserved.

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    let url = URL(string: "192.168.0.104:8080")
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func TapTheScreee(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        EmailTextField.endEditing(true)
        PasswordTextField.endEditing(true)
    }
    
    @IBAction func ForgotPassClicked(_ sender: UIButton) {
        print("Forgot password")
    }
    
    @IBAction func LoginClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "goToHomeScreen", sender: self)
        let buttonID = sender.restorationIdentifier!
        switch buttonID {
        case "Signin":
            print("signin")
            break
        case "FBLogin":
            print("fblogin")
            break
        case "TwitterLogin":
            print("tweet login")
            break
        default:
            print("default")
        }
        return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailTextField.text = "admin"
        PasswordTextField.text = "1234"
        EmailTextField.delegate = self
        PasswordTextField.delegate = self
        EmailTextField.becomeFirstResponder()
        initView()
    }
}
extension LoginViewController{
    func initView() {
    }
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
