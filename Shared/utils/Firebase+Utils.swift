//
//  Firebase+Utils.swift
//  Artable
//
//  Created by Pardip Bhatti on 10/06/19.
//  Copyright © 2019 Pardip Bhatti. All rights reserved.
//

import Foundation
import Firebase

extension Auth {
    func handleFireAuthError(error: Error, vc: UIViewController)  {
        
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            let alert = UIAlertController(title: "Error", message: errorCode.errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    func simpleAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account. Pick another email"
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again"
        case .userDisabled:
            return "Your accounthas been disabled. Please contact support"
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter valid email"
        case .networkError:
            return "Network error. Please try again"
        case .weakPassword:
            return "You password is too weak. the must be 6 characters logn or more"
        case .wrongPassword:
            return "Your password or email is incorrect"
            
        default:
            return "Sorry, something went wrong"
        }
    }
}
