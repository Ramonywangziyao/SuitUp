//
//  LaunchViewController.swift
//  Suitup
//
//  Created by Ziyao Wang on 3/29/17.
//  Copyright © 2017 Ziyao Wang. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit
import UIKit
import RealmSwift

class LaunchViewController: UIViewController,FBSDKLoginButtonDelegate {
    
    
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func FBLoginButtonClick(_ sender: Any) {
        FBSDKLoginManager().logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { (result, error) in
            if error != nil{
                print("longinerror =\(error)")
                return
            }
            self.fetchProfile()
            if (FBSDKAccessToken.current()) != nil{
                self.performSegue(withIdentifier: "loggedSegue", sender: self)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchProfile(){
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: {
            connection, result, error -> Void in
            var localUsr = LocalUser()
            let realm = try! Realm()
            if error != nil {
                print("longinerror =\(error)")
            } else {
                if let resultNew = result as? [String:Any]{
                    let usremail = resultNew["email"]  as! String
                    localUsr.usremail = usremail
                    let usrfirstname = resultNew["first_name"] as! String
                    localUsr.usrfirstname=usrfirstname
                    let usrlastname = resultNew["last_name"] as! String
                    localUsr.usrlastname=usrlastname
                    if let picture = resultNew["picture"] as? NSDictionary,
                        let data = picture["data"] as? NSDictionary{
                        let usrpicurl = data["url"] as? String
                        localUsr.usrpicurl=usrpicurl!
                    }
                }
            }
            try! realm.write {
                realm.add(localUsr)
            }
        })
    }
    

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
 
    
}
