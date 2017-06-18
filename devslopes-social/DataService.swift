//
//  DataService.swift
//  devslopes-social
//
//  Created by Marton Zeisler on 2017. 06. 18..
//  Copyright © 2017. scapp. All rights reserved.
//

import Foundation
import Firebase
import SwiftKeychainWrapper

let DB_BASE = Database.database().reference()

class DataService{
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    
    private var _REF_POSTS = DB_BASE.child("posts") // from firebase database structure
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: DatabaseReference{
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference{
        return _REF_POSTS
    }
    
    var REF_USERS: DatabaseReference{
        return _REF_USERS
    }
    
    func createFirbaseDBUser(uid: String, userData: Dictionary<String, String>){ // for the dictionary: likes-id, posts-id
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
    
    
    
    
}
