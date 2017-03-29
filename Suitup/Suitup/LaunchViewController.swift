//
//  LaunchViewController.swift
//  Suitup
//
//  Created by Ziyao Wang on 3/29/17.
//  Copyright © 2017 Ziyao Wang. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import FBSDKLoginKit
import UIKit

class LaunchViewController: UIViewController {
    
    let loginButton = LoginButton(readPermissions: [ .publicProfile ])
    
    
    struct MyProfileRequest: GraphRequestProtocol {
        struct Response: GraphResponseProtocol {
            init(rawResponse: Any?) {
                // Decode JSON from rawResponse into other properties here.
            }
        }
        
        var graphPath = "/me"
        var parameters: [String : Any]? = ["fields": "id, name"]
        var accessToken = AccessToken.current
        var httpMethod: GraphRequestHTTPMethod = .GET
        var apiVersion: GraphAPIVersion = .defaultVersion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.center = view.center
        view.addSubview(loginButton)
        if let accessToken = AccessToken.current {
            //fetch user info
            //fetchProfile()
            
            //transit to main view
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchProfile(){
        
        
        
    }

    
}
