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
let STORAGE_BASE = Storage.storage().reference()

class DataService{
    
    static let ds = DataService()
    
    // database references
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts") // from firebase database structure
    private var _REF_USERS = DB_BASE.child("users")
    
    
    // storage references
    private var _REF_POST_IMAGES = STORAGE_BASE.child("post-pics")
    
    var REF_BASE: DatabaseReference{
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference{
        return _REF_POSTS
    }
    
    var REF_USERS: DatabaseReference{
        return _REF_USERS
    }
    
    var REF_POST_IMAGES: StorageReference{
        return _REF_POST_IMAGES
    }
    
    
    func createFirbaseDBUser(uid: String, userData: Dictionary<String, String>){ // for the dictionary: likes-id, posts-id
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
    
    
    
    
}
