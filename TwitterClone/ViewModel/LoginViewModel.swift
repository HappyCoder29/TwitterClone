//
//  LoginViewModel.swift
//  TwitterClone
//
//  Created by Ashish Ashish on 12/10/20.
//

import Foundation

class LoginViewModel{
    
    
    func validateEmailPassword(email: String, password: String) -> String {
        if email == "" || password == ""  || password.count < 6{
            return strEmailPasswordBlank
        }
        if email.isEMail == false {
            return strInvalidEMail
        }
        return ""
    }
    
}
