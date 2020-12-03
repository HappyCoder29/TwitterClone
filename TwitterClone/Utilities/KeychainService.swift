//
//  KeychainService.swift
//  TwitterClone
//
//  Created by Ashish Ashish on 11/19/20.
//

import Foundation
import KeychainSwift

class KeychainService{
    var _localVar = KeychainSwift()
    var keyChain : KeychainSwift{
        get {
            return _localVar
        }
        set {
            _localVar = newValue
        }
    }
    
}
