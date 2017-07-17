//
//  UserRegistryViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 5/17/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class UserRegistryViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var SignUpView: UIView!
   
    @IBOutlet weak var AvatarImageView: UIImageView!
    
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    var imagePicker: UIImagePickerController!

    
    @IBAction func TakeAvatarButtonClicked(_ sender: UIButton) {
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        // Add action
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { [unowned self] action -> Void in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { [unowned self] action -> Void in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let controller = UIAlertController(title: "take new photo or get form library?", message: nil, preferredStyle: .actionSheet)
        for action in [takePhotoAction, libraryAction, cancelAction] {
            controller.addAction(action)
        }
        present(controller, animated: true,completion: nil)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        AvatarImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        AvatarImageView.clipsToBounds = true
        AvatarImageView.layer.cornerRadius = AvatarImageView.frame.height/2
        self.view.sendSubview(toBack: AvatarImageView!)
    }
    @IBAction func CloseButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SignupButtonClicked(_ sender: UIButton) {
        dismiss(animated:true,completion:nil)
    }
    @IBAction func TapRecognizer(_ sender: UITapGestureRecognizer) {
        UserNameTextField.endEditing(true)
        EmailTextField.endEditing(true)
        PasswordTextField.endEditing(true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        view.frame.origin = CGPoint(x: 0, y: -200)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.frame.origin = CGPoint(x: 0, y: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Sign Up")
        self.SignUpView.insertSubview(backgroundImage, at: 0)

        UserNameTextField.delegate = self
        EmailTextField.delegate = self
        PasswordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
