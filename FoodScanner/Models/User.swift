//
//  User.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/24/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation

struct User {
    var name:String?
    var shortBio:String?
    var username:String?
    var photoURL : String?
    var backgroundURL:String?
    var isEmailVerified:Bool?
    var connectionCount:Int?
    var isAdmin:Bool?
    var isOnline :Bool?
    init(with json:[String:Any]) {
       name = json[.name] as? String
       shortBio = json[.shortBio] as? String
       username = json[.username] as? String
       photoURL = json[.photoUrl] as? String
       backgroundURL = json[.backgroundUrl] as? String
       isEmailVerified = json[.isEmailVerifid] as? Bool
       connectionCount = json[.connectionCount] as? Int
       isAdmin = json[.isAdmin] as? Bool
       isOnline = json[.isOnline] as? Bool
    }
}

