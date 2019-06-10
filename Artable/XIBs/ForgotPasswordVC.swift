//
//  ForgotPasswordVC.swift
//  Artable
//
//  Created by Pardip Bhatti on 10/06/19.
//  Copyright © 2019 Pardip Bhatti. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetPasswordTapped(_ sender: Any) {
        
        guard let email = emailTxt.text, email.isNotEmpty else {
            Auth.auth().simpleAlert(title: "Error", message: "You must need to enter email address", vc: self)
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                Auth.auth().handleFireAuthError(error: error, vc: self)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    
}
