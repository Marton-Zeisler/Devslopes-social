//
//  SignInVC.swift
//  devslopes-social
//
//  Created by Marton Zeisler on 2017. 06. 17..
//  Copyright © 2017. scapp. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        
    
    }
    
    
    
    @IBAction func facebookBtnPressed(_ sender: Any) {  // Facebook authorization
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil{
                print("Marton: Unable to authenticate with Facebook - \(String(describing: error))")
            }else if result?.isCancelled == true{
                print("Marton: User cancalled Facebook authentication")
            }else{
                print("Marton: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString )
                self.firebaseAuth(credential)
            }
        
            
        }
        
    } // end of func
    
    func firebaseAuth(_ credential: AuthCredential) {   // // Firebase authorization
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Marton: Unable to authenticate with Firebase - \(String(describing: error))")
            } else {
                print("Marton: Successfully authenticated with Firebase")
                
                
//                if let user = user {
//                    let userData = ["provider": credential.provider]
//                    self.completeSignIn(id: user.uid, userData: userData)
//                }
                
                
            }
        })
    } // end of func
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

