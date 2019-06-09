//
//  RegisterVC.swift
//  Artable
//
//  Created by Pardip Bhatti on 10/06/19.
//  Copyright © 2019 Pardip Bhatti. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckimg: UIImageView!
    @IBOutlet weak var confirmpassCheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let passTxt = passwordTxt.text else {
            return
        }
        
        guard let confPassTxt = confirmPassTxt.text else {
            return
        }
        
        if textField == confirmPassTxt {
            if confPassTxt.isEmpty {
                passCheckimg.isHidden = true
                confirmpassCheckImg.isHidden = true
            } else {
                passCheckimg.isHidden = false
                confirmpassCheckImg.isHidden = false
            }
            
        } else {
            if passTxt.isEmpty {
                passCheckimg.isHidden = true
                confirmpassCheckImg.isHidden = true
                confirmPassTxt.text = ""
            }
        }
        
        // Make it so when the passwords match, the checkmarks turn green
        if passwordTxt.text == confirmPassTxt.text {
            passCheckimg.image = UIImage(named: AppImages.GreenCheck)
            confirmpassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passCheckimg.image = UIImage(named: AppImages.RedCheck)
            confirmpassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }

    @IBAction func registerTapped(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,
            let username = usernameTxt.text, username.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            self.activityIndicator.stopAnimating()
            
            if let error = error {
                debugPrint(error)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
