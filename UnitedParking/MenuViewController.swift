//
//  MenuViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 4/26/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var originalLeftMargin:CGFloat!
    let MAX_LEFT_MARGIN = CGFloat(80)
    var viewControllers: [UIViewController]!
    var PaymentMethod = "PaymentViewController"
    var selectedIndex = 0
    var user:User!
    
    @IBOutlet weak var ContentLeftMarginConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var AvatarImageView: UIImageView!
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var ContentView: UIView!
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
        //Get Access to the Previous and Current Tab Button.
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        if sender.tag == 6{
            dismiss(animated: true, completion: nil)
            return
        }        
        //Remove the Previous ViewController and Set Button State.
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        //Add the New ViewController and Set Button State.
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.bounds = ContentView.bounds
        ContentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        
        //Hide menu view
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: {
            
            self.ContentLeftMarginConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    @IBAction func AvatarTapGesture(_ sender: UITapGestureRecognizer!){
        sender.numberOfTapsRequired = 1
        changeAvatar()
    }
    
    @IBAction func onPanGuesture(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        if sender.state == UIGestureRecognizerState.began{
            originalLeftMargin = ContentLeftMarginConstraint.constant
        }else if sender.state == UIGestureRecognizerState.changed{
            if transition.x<0 {
                return
            }
            if transition.x > view.frame.size.width - MAX_LEFT_MARGIN {
                return
            }
            ContentLeftMarginConstraint.constant = originalLeftMargin + transition.x
            
        }else if sender.state == UIGestureRecognizerState.ended{
            if (transition.x < 0)&&(originalLeftMargin==0) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.ContentLeftMarginConstraint.constant = 0
                })
                return
            }
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: {
                if velocity.x > 0 {
                    self.ContentLeftMarginConstraint.constant = self.view.frame.size.width/2 + 30// - self.MAX_LEFT_MARGIN
                }else{
                    self.ContentLeftMarginConstraint.constant = 0
                }
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func edgePanRegconize(_ sender: UIScreenEdgePanGestureRecognizer) {
        onPanGuesture(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
        //Add Edge Pan Recognize
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePanRegconize))
        edgePan.edges = .left
        view.addGestureRecognizer(edgePan)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension MenuViewController{
    func initView() {
        let homeVC = UIStoryboard(name: "Home", bundle: nil)
            .instantiateViewController(withIdentifier: "HomeViewController")
            as! HomeViewController
        
        let paymentVC = UIStoryboard(name: "Payment", bundle: nil)
            .instantiateViewController(withIdentifier: "PaymentViewController")
            as! PaymentViewController
        
        let mapVC = UIStoryboard(name: "Map", bundle: nil)
            .instantiateViewController(withIdentifier: "MapViewController")
            as! MapViewController
        
        let reportsVC = UIStoryboard(name: "Reports", bundle: nil)
            .instantiateViewController(withIdentifier: "ReportsViewController")
            as! ReportsViewController
        
        let forPKOwnerVC = UIStoryboard(name: "ForPKOwner", bundle: nil)
            .instantiateViewController(withIdentifier: "ForPKOwnerViewController")
            as! ForPKOwnerViewController
        
        let scanQRVC = UIStoryboard(name: "ScanQR", bundle: nil)
            .instantiateViewController(withIdentifier: "ScanQRViewController")
            as! ScanQRViewController
        
        viewControllers = [homeVC,paymentVC,mapVC,reportsVC,forPKOwnerVC,scanQRVC]
        
        //Add the default ViewController
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.bounds = ContentView.bounds
        ContentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
    func setView() {
        AvatarImageView.clipsToBounds = true
        AvatarImageView.layer.cornerRadius = AvatarImageView.frame.width/2
    }
    func attachtPropertiesForVC(_ tag:Int) {
        //[Home,Payment,....,....,....]
        user.balance = "3,000"
        user.cardBrand = "Master"
        user.creditCard = "2345"
    }
    func changeAvatar() {
        let editVC = UIStoryboard(name: "UserEdit", bundle: nil).instantiateViewController(withIdentifier: "UserEditViewController")
        present(editVC, animated: true, completion: nil)
    }
}
