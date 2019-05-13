//
//  UserdefaultHelper.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/21/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
class UserdefaultHelper {
    static fileprivate var imageId = "imageId"
    static fileprivate var isLoggedIn = "loggedIn"
    static func loggedIn() {
        UserDefaults.standard.set(true, forKey: isLoggedIn)
    }
    
    static func loggetOut() {
         UserDefaults.standard.set(false, forKey: isLoggedIn)
    }
    
    static func checkUserStatus() ->Bool {
        if let userStatus = UserDefaults.standard.bool(forKey: isLoggedIn) as? Bool {
            return userStatus
        }
        return false
    }
    
    static func getImageId() -> Int {
        return UserDefaults.standard.integer(forKey: imageId)
    }
    
    static func setImageId(uId:Int)  {
        if uId == 0 {
            let imgId = 1
            UserDefaults.standard.set(imgId, forKey: imageId)
            return
        }
        UserDefaults.standard.set(uId, forKey: imageId)
    }
    
    static func incrementUserId()  {
        if let uid = getImageId() as? Int {
           let newUid = uid + 1
            setImageId(uId: newUid)
        }
        
    }
}
