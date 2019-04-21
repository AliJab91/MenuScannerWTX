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
