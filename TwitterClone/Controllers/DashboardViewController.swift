//
//  DashboardViewController.swift
//  TwitterClone
//
//  Created by Ashish Ashish on 11/19/20.
//

import UIKit
import Firebase

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logout_Action(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            KeychainService().keyChain.delete("uid")
            self.navigationController?.popViewController(animated: true)
        }catch{
            print(error)
            
        }
    }
}
