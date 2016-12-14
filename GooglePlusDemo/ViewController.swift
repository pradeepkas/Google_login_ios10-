//
//  ViewController.swift
//  GooglePlusDemo
//
//  Created by appstudioz on 12/8/16.
//  Copyright © 2016 Pradeep. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google
import  SafariServices
class ViewController: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate{

    
    //MARK: View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         googleLogin()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    
    // MARK:- funtion for google signIn
    func googleLogin() {
        
        GIDSignIn.sharedInstance().clientID = "Your_Google_Client_ID"
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        GIDSignIn.sharedInstance().uiDelegate = self
    
        GIDSignIn.sharedInstance().scopes = ["https://www.googleapis.com/auth/plus.login","https://www.googleapis.com/auth/plus.me"]
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signIn()
        

    }
    
    
    //MARK:- Google signin delegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            print(user.profile.name)
            print(user.profile.email)
            print(user.profile.familyName)
            
        } else {
            print("\(error.localizedDescription)")
        }
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("Error Google SignIn:" + "\(error)")

    }
  
    }
        
}

