//
//  UtilitiesTests.swift
//  TwitterCloneTests
//
//  Created by Ashish Ashish on 12/10/20.
//

import Foundation
import Quick
import Nimble

@testable import TwitterClone

class UtilitiesSpec : QuickSpec{
    override func spec() {
        describe("check if string is of type email") {
            it("string should return true if the string conforms to email type"){
                let str = "ashish@gmail.com"
                expect(str.isEMail).to(beTrue())
            }
            it("string should return false if the string does notconforms to email type"){
                let str = "not an e mail"
                expect(str.isEMail).to(beFalse())
            }
        }
    }
}
