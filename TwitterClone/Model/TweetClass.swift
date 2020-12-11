//
//  TweetClass.swift
//  TwitterClone
//
//  Created by Ashish Ashish on 12/10/20.
//

import Foundation
import Firebase

class TweetClass{
    var uid: String = ""
    var author : String = ""
    var email : String = ""
    var tweet  : String = ""
    var dateTime : Double
    var imageUrl : String = ""
    
    init(_ user: User!,_ tweet: String,_ dateTime: Double, _ imageUrl : String = "") {
        self.uid = user.uid
        self.author = user.displayName ?? "Not Set"
        self.email = user.email ?? "Not Set"
        self.tweet = tweet
        self.dateTime = dateTime
        self.imageUrl = imageUrl
    }
    
}
