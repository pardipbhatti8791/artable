//
//  ViewController.swift
//  Artable
//
//  Created by Pardip Bhatti on 10/06/19.
//  Copyright © 2019 Pardip Bhatti. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var loginOutBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { (result, error) in
                if let error = error {
                    Auth.auth().handleFireAuthError(error: error, vc: self)
                }
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser, !user.isAnonymous {
            // We are logged in
           loginOutBtn.title = "Logout"
        } else {
            loginOutBtn.title = "Login"
//            presentLoginController()
        }
    }
    
    fileprivate func presentLoginController() {
        let storyboard = UIStoryboard(name: StoryBoard.LoginStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func loginOutTapped(_ sender: Any) {
        
        guard let user = Auth.auth().currentUser else { return }
        
        if user.isAnonymous {
                presentLoginController()
        } else {
            do {
                try Auth.auth().signOut()
                Auth.auth().signInAnonymously { (result, error) in
                    if let error = error {
                        Auth.auth().handleFireAuthError(error: error, vc: self)
                    }
                    
                    self.presentLoginController()
                }
            } catch{
                debugPrint(error)
            }
        }
    }
    
}

