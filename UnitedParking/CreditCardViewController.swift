//
//  CreditCardViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 4/30/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class CreditCardViewController: UIViewController,UITextFieldDelegate {
    var cardBrand_: String!
    var user:User!
    var cardBrand: String{
        get{
            return cardBrand_
        }
        set (input){
            cardBrand_ = input
            setLogo()
        }
    }
    var cardNumberCount = 0
    
    

    @IBOutlet weak var LogoCardImageView: UIImageView!
    @IBOutlet weak var TailNumberLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var ValidTilLabel: UILabel!
    
    @IBOutlet weak var FullnameTextField: UITextField!
    
    @IBOutlet weak var CardNumberTextField: UITextField!
    
    @IBOutlet weak var SecurityCodeTextField: UITextField!

    
    
    @IBAction func SaveButton(_ sender: UIButton) {
        let cardNumber = CardNumberTextField.text
        let fullName = FullnameTextField.text
        
        if fullName != "" {
            NameLabel.text = fullName
        }
        if cardNumber?.characters.count == 19 {
            TailNumberLabel.text = cardNumber?.substring(from: (cardNumber?.index((cardNumber?.startIndex)!, offsetBy: 15))!) ?? "9999"
        }
        ValidTilLabel.text = "10/2019"
        cardBrand = "Master"
    }
    
    @IBAction func TapGesture(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        FullnameTextField.endEditing(true)
        CardNumberTextField.endEditing(true)
        SecurityCodeTextField.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setView()
        setLogo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension CreditCardViewController{
    func setLogo() {
        if cardBrand == "Master" {
            LogoCardImageView.image = UIImage(named: "Mastercard Logo")
        }else if cardBrand == "Visa"{
            LogoCardImageView.image = UIImage(named: "Visa Logo")
        }
    }
    func setView() {
        FullnameTextField.delegate = self
        CardNumberTextField.delegate = self
        SecurityCodeTextField.delegate = self
        
        FullnameTextField.addTarget(self, action: #selector(FullnameTextFieldDidChange(_:)), for: .editingChanged)
        CardNumberTextField.addTarget(self, action: #selector(CardNumberTextFieldDidChange(_:)), for: .editingChanged)
        SecurityCodeTextField.addTarget(self, action: #selector(SecurityCodeTextFieldDidChange(_:)), for: .editingChanged)
        
        CardNumberTextField.keyboardType = UIKeyboardType.phonePad
        SecurityCodeTextField.keyboardType = UIKeyboardType.phonePad

        NameLabel.text = "Tieu Dat"
        TailNumberLabel.text = "9999"
        ValidTilLabel.text = "10/2019"
        cardBrand = "Master"
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.frame.origin = CGPoint(x: 0, y: -200)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.frame.origin = CGPoint(x: 0, y: 0)
    }
    func FullnameTextFieldDidChange(_ textField: UITextField) {
        //
    }
    func CardNumberTextFieldDidChange(_ textField: UITextField) {
        var cardNumber = textField.text
        let currentCardNumberCount = cardNumber?.characters.count
        
        if cardNumberCount > (currentCardNumberCount)!{
            cardNumberCount = currentCardNumberCount!
            return
        }

        if (currentCardNumberCount)! == 20 {
            cardNumber?.remove(at: (cardNumber?.index(before: (cardNumber?.endIndex)!))!)
        }else if ((currentCardNumberCount)! == 4) || ((currentCardNumberCount)! == 9) || ((currentCardNumberCount)! == 14) {
            cardNumber?.insert(" ", at: (cardNumber?.endIndex)!)
        }
        cardNumberCount = currentCardNumberCount!
        textField.text = cardNumber
    }
    func SecurityCodeTextFieldDidChange(_ textField: UITextField) {
        var cvc = textField.text
        if (cvc?.characters.count)! == 4 {
            cvc?.remove(at: (cvc?.index(before: (cvc?.endIndex)!))!)
        }
        textField.text = cvc
    }
}


