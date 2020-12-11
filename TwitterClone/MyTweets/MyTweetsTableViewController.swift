//
//  MyTweetsTableViewController.swift
//  TwitterClone
//
//  Created by Ashish Ashish on 12/10/20.
//

import UIKit
import Firebase

class MyTweetsTableViewController: UITableViewController {

    var arr : [TweetClass] = []
    
    @IBOutlet var tblView: UITableView!
    
    var user : User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = Auth.auth().currentUser
        loadPosts()
    }
    
    func loadPosts(){
        let ref = Database.database().reference().child("Tweets").child(user!.uid)
        
        ref.observeSingleEvent(of: .value) { snapshot in
            guard let dict = snapshot.value as? [String: AnyObject] else {return}
            for each in dict as [String: AnyObject]{
               // let author = each.value["Author"] as! String
               // let email = each.value["Email"] as! String
                let tweet = each.value["Tweet"] as! String
                let timeStamp = each.value["DateTime"] as! Double
                //let time = self.convertTimestamp(serverTimestamp: timeStamp)
                
                let tweetClass = TweetClass(self.user, tweet, timeStamp)
                self.arr.append(tweetClass)
            
            }
            self.tblView.reloadData()
            
        } withCancel: { (error) in
            print(error.localizedDescription)
        }

    }
    
    func convertTimestamp(serverTimestamp: Double) -> String {
        let x = serverTimestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        let time = "\(formatter.string(from: date as Date)), \(timeFormatter.string(from: date as Date))"
        print(time)
        return time
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let email = user?.email
        let tweet = arr[indexPath.row].tweet
        let time = convertTimestamp( serverTimestamp: arr[indexPath.row].dateTime )
        cell.textLabel?.text = "\(email!): \(tweet) at \(time)"

        return cell
    }
    

}
