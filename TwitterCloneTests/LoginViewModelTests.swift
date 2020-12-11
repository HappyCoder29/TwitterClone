//
//  LoginViewModelTests.swift
//  TwitterCloneTests
//
//  Created by Ashish Ashish on 12/10/20.
//

import Foundation
import Quick
import Nimble
@testable import TwitterClone

class LoginViewModelSpec: QuickSpec{
    override func spec() {
        describe("check if email and password are correct") {
            it("empty email and password is blank validateEmailPassword should return an error"){
                let email = ""
                let password = ""
                let viewModel = LoginViewModel()
                expect(viewModel.validateEmailPassword(email:email, password: password)).toNot(be(""))
            }
            
            it("empty email is blank validateEmailPassword should return an error"){
                let email = ""
                let password = "abcdefgh"
                let viewModel = LoginViewModel()
                expect(viewModel.validateEmailPassword(email:email, password: password)).toNot(be(""))
            }
            
            it("empty password is blank validateEmailPassword should return an error"){
                let email = "ashish@test.com"
                let password = ""
                let viewModel = LoginViewModel()
                expect(viewModel.validateEmailPassword(email:email, password: password)).toNot(be(""))
            }
            
            it("password is less than 6 characters validateEmailPassword should return an error"){
                let email = "ashish@test.com"
                let password = "ABCDE"
                let viewModel = LoginViewModel()
                expect(viewModel.validateEmailPassword(email:email, password: password)).toNot(be(""))
            }
            
            it("if email is not of type e mail validateEmailPassword should return an error"){
                let email = "ashish"
                let password = "ABCDEFGH"
                let viewModel = LoginViewModel()
                expect(viewModel.validateEmailPassword(email:email, password: password)).toNot(be(""))
            }
            
            it("if email and password are of proper type validateEmailPassword should not return an error"){
                let email = "ashish@gmail.com"
                let password = "ABCDEFGH"
                let viewModel = LoginViewModel()
                expect(viewModel.validateEmailPassword(email:email, password: password)).to(be(""))
            }
            
        }
    }
    
}
