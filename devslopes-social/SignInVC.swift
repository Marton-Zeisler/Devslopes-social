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
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var emailField: FancyField!

    @IBOutlet weak var pwdField: FancyField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            print("Marton: ID found in keychain")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
        
        
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
                
                
                if let user = user {
                    //let userData = ["provider": credential.provider]
                    //self.completeSignIn(id: user.uid, userData: userData)
                    self.completeSignIn(id: user.uid)
                }
                
                
            }
        })
    } // end of func
    
    
    @IBAction func signInTapped(_ sender: Any) {    // Email authorization minimum 5 chars
        
        if let email = emailField.text, let pwd = pwdField.text{
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil{
                    print("Marton: Email user authenticated with Firebase")
                    
                    if let user = user {
                        //let userData = ["provider": user.providerID]
                        //self.completeSignIn(id: user.uid, userData: userData)
                        self.completeSignIn(id: user.uid)
                    }
                    
                    
                }else{
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil{
                            print("Marton: Unable to authenticate with Firebase using email")
                        }else{
                            print("Marton: Successfully authenticated with Firebase")
                            if let user = user {
                                //let userData = ["provider": user.providerID]
                                //self.completeSignIn(id: user.uid, userData: userData)
                                self.completeSignIn(id: user.uid)
                            }
                            
                        }
                    })
                }
            })
        }
        
        
        
    } // end of func
    
    
//    func completeSignIn(id: String, userData: Dictionary<String, String>) {
      func completeSignIn(id: String)  {
        
        //DataService.ds.createFirbaseDBUser(uid: id, userData: userData)

        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        
        
        print("Marton: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
        
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

