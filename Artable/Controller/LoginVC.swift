//
//  LoginVC.swift
//  Artable
//
//  Created by Pardip Bhatti on 10/06/19.
//  Copyright © 2019 Pardip Bhatti. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,
        let password = passwordTxt.text, password.isNotEmpty else {
            Auth.auth().simpleAlert(title: "Error", message: "Please fill out all fields", vc: self)
            return
        }
        
        activityIndicator.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            self.activityIndicator.stopAnimating()
            if let error = error {
                Auth.auth().handleFireAuthError(error: error, vc: self)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        let vc = ForgotPasswordVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func guestTapped(_ sender: Any) {
    }
    
}
