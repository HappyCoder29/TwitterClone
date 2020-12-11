//
//  ViewController.swift
//  TwitterClone
//
//  Created by Ashish Ashish on 11/19/20.
//

import UIKit
import Firebase
import SnapKit

class LoginViewController: UIViewController {
    
    lazy var txtEmail: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = strEMail
        txtField.textAlignment = .center
        return txtField
    }()
    
    lazy var txtPassword: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = strPassword
        txtField.isSecureTextEntry = true
        txtField.textAlignment = .center
        return txtField
    }()
    
    lazy var lblStatus: UILabel = {
        let lbl = UILabel()
        lbl.text = strStatus
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var btnLogin: UIButton = {
        let btn = UIButton()
        btn.setTitle(strLogin, for: .normal)
        btn.addTarget(self, action: #selector(login), for: .touchUpInside)
        btn.setTitleColor(.link, for: .normal)
        return btn
    }()
    
    lazy var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElements()
        inflateViews()
    }
    
    func addElements(){
        self.view.addSubview(txtEmail)
        self.view.addSubview(txtPassword)
        self.view.addSubview(btnLogin)
        self.view.addSubview(lblStatus)
    }
    
    func inflateViews(){
        txtEmail.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
        
        txtPassword.snp.makeConstraints { make in
            make.top.equalTo(txtEmail).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
        
        btnLogin.snp.makeConstraints { make in
            make.top.equalTo(txtPassword).offset(60)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
        
        lblStatus.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let keyChain = KeychainService().keyChain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "dashboardSegue", sender: self)
        }
        txtPassword.text = ""
    }
    
   
    func addKeychainAfterLogin(_ uid : String){
        let keyChain = KeychainService().keyChain
        keyChain.set(uid , forKey: "uid")
        
    }
    
    @objc func login(_ sender : UIButton){
        let email = txtEmail.text!
        let password = txtPassword.text!
        
        lblStatus.text = viewModel.validateEmailPassword(email: email, password: password)
        
        if lblStatus.text != ""{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if error != nil {
                self?.lblStatus.text = error?.localizedDescription
                return
            }
            
            let uid = Auth.auth().currentUser?.uid
            
            strongSelf.addKeychainAfterLogin(uid!)
            
            strongSelf.performSegue(withIdentifier: "dashboardSegue", sender: strongSelf)
        }
        
    }
    
    
    
    @IBAction func login_Action(_ sender: Any) {
        
        
    }
    
    


}

