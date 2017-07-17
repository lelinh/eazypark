//
//  UserEditViewController.swift
//  UnitedParking
//
//  Created by Linh Le on 5/17/17.
//  Copyright © 2017 Linh Le. All rights reserved.
//

import UIKit

class UserEditViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var IDNumberTextField: UITextField!
    
    @IBOutlet weak var AvatarImageView: UIImageView!
    
    @IBOutlet weak var VehicalID1: UITextField!
    @IBOutlet weak var VehicalID2: UITextField!
    @IBOutlet weak var VehicalID3: UITextField!
    @IBOutlet weak var VehicalID4: UITextField!
    @IBOutlet weak var VehicalID5: UITextField!
    var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        VehicalID1.delegate = self
        VehicalID2.delegate = self
        VehicalID3.delegate = self
        VehicalID4.delegate = self
        VehicalID5.delegate = self
        AvatarImageView.clipsToBounds = true
        AvatarImageView.layer.cornerRadius = AvatarImageView.frame.height/2
        AvatarImageView.image = #imageLiteral(resourceName: "avatar")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func TapRecognizer(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        VehicalID1.endEditing(true)
        VehicalID2.endEditing(true)
        VehicalID3.endEditing(true)
        VehicalID4.endEditing(true)
        VehicalID5.endEditing(true)
    }
    @IBAction func ChangeAvatar(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
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
    }
}
