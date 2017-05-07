//
//  Payment1ViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 5/2/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    var user:User!
    var selectedIndex = 0
    var ViewControllers: [UIViewController]!
    
    
    @IBOutlet weak var ContentView: UIView!
    
    @IBAction func ChangePaymentMethodButtonClicked(_ sender: UIButton) {
        print(sender.tag)
        changePaymentMethod(sender.tag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func changePaymentMethod(_ tag:Int) {
        //Get Access to the Previous and Current Tab Button.
        let previousIndex = selectedIndex
        selectedIndex = tag
        
        let previousVC = ViewControllers[previousIndex]
        let currentVC = ViewControllers[selectedIndex]
        
        
        //Remove the Previous ViewController and Set Button State.
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        //Add the New ViewController and Set Button State.
        addChildViewController(currentVC)
        currentVC.view.bounds = ContentView.bounds
        ContentView.addSubview(currentVC.view)
        currentVC.didMove(toParentViewController: self)
    }
    func getUserInfo() {
        //
    }
    func initView() {
        
        let PrePaidVC = UIStoryboard(name: "Payment", bundle: nil)
            .instantiateViewController(withIdentifier: "PrePaidViewController")
            as! PrePaidViewController
        let CreditCardVC = UIStoryboard(name: "Payment", bundle: nil)
            .instantiateViewController(withIdentifier: "CreditCardViewController")
            as! CreditCardViewController
        ViewControllers = [PrePaidVC,CreditCardVC]
        
        changePaymentMethod(0)
    }
}
