//
//  TweetViewController.swift
//  TwitterClone
//
//  Created by Ashish Ashish on 11/19/20.
//

import UIKit
import Firebase
import Toast_Swift

class TweetViewController: UIViewController {
    @IBOutlet weak var txtTweet: UITextView!
    
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        user = Auth.auth().currentUser
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func tweet_Action(_ sender: Any) {
        
        let uid = Auth.auth().currentUser?.uid
        let userID = uid!
        
        let dbRef = Database.database().reference()
        
        guard let key = dbRef.child("Tweets").child(userID).childByAutoId().key else { return}
        
        //let tweet = TweetClass(Auth.auth().currentUser!, txtTweet.text!)
        let post: [String: Any] = [ "uid": user!.uid,
                                    "Author": user!.displayName,
                                    "Email": user!.email,
                                    "Tweet": txtTweet.text!,
                                    "DateTime": ServerValue.timestamp(),
                                    "ImageUrl": ""]
        
        let childUpdates = ["/Tweets/\(userID)/\(key)" : post]
        dbRef.updateChildValues(childUpdates)
        self.view.makeToast("Your Tweet is posted", duration: 3.0, position: .center)
        txtTweet.text = ""
        
    }
    

}
