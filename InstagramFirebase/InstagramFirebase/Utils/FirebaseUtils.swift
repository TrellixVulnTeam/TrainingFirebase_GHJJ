//
//  FirebaseUtils.swift
//  InstagramFirebase
//
//  Created by Ivica Petrsoric on 02/02/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import Foundation
import Firebase

extension Database{
    
    static func fetchUserWithUID(uid: String, completion: @escaping(User) -> ()){
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let userDictionary = snapshot.value as? [String: Any] else { return }
            
            let user = User(uid: uid , dictionary: userDictionary)
            
            completion(user)
            
        }) { (err) in
            print("Failed to fetch user for post:", err)
        }
    }
}
