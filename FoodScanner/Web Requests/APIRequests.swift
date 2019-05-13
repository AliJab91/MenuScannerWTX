//
//  APIRequests.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/24/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import Alamofire
enum URLStrings {
    static let loginURL = "http://159.65.89.34/oauth/login/apilogin"
    static let registationURL = "http://159.65.89.34/oauth/login/apiregister"
    static let apikey = "1XPInXLhxxfeRZ5Z"
    static let checkIfUsernameFreeURL = "http://159.65.89.34/oauth/login/isusernamefree"
    static let checkIfEmailIsFree = "http://159.65.89.34/oauth/login/isemailfree"
}


class APIRequests {
    fileprivate static func postRequest (urlString:String!,parameters:Parameters?, method:HTTPMethod, headers:HTTPHeaders?, completion:@escaping(Bool,Error?,DataResponse<Any>?)->()) {
        Alamofire.request(urlString, method: .post, parameters: parameters,encoding:URLEncoding.default).responseJSON { (response) in
            let success = checkIfSucccess(response: response)
            if(success){
                completion(success, nil, response)
            }else {
                completion (success,response.error,nil)
            }
//            
//        
    }
}
    
    fileprivate static func checkIfSucccess(response: DataResponse<Any>!) -> Bool {
        if let responseDict = response.result.value as? [String:Any] {
            print(responseDict)
            if let status = responseDict["Status"] as? String {
                if status == "Successful" {
                    return true
                }
                return false
            }else if let available = responseDict["IsFree"] as? Bool {
                if(available) {
                    return true
                }
                return false
            }
        }else {
            return false
        }
        return false
    }
    
    static func loginWithEmail(email:String,password:String, completion:@escaping(Bool,Error?,User?)->())  {
    let parameter = ["apiKey":URLStrings.apikey,"Username":email,"password":password]
        let url = URLStrings.loginURL
        postRequest(urlString: url, parameters: parameter, method: .post, headers: nil) { (success, error, response) in
            if success {
                guard let jsonDict = response?.result.value as? [String:Any] else {
                    return
                }
                let user = User.init(with:jsonDict["BriefProfile"] as! [String : Any])
                completion(success,nil,user)
            }else {
                completion(false,error,nil)
            }
        }
    }
    
    static func registerUserWithName(name:String, usename:String,email:String,password:String,memorablePlaces:String,backupEmail:String,companyName:String , completion:@escaping(Bool,Error?)->()) {
        let parameter = ["Name":name,"Password":password,"Username":usename,"apiKey":URLStrings.apikey,"CompanyName":companyName,"BackupEmail":backupEmail,"Email":email,"MemorablePlace":memorablePlaces]
        let url = URLStrings.registationURL
        postRequest(urlString: url, parameters: parameter, method: .post, headers: nil) { (success, error, response) in
            if success {
                completion(success,nil)
            }else {
                completion(false,error)
            }
        }
    }
    
    static func checkIfUsernameExistWithName(username:String, completion:@escaping(Bool ,Error?)->()) {
        let parameter = ["username":username]
        let url = URLStrings.checkIfUsernameFreeURL
        postRequest(urlString: url, parameters: parameter, method: .post, headers: nil) { (success, error, response) in
            if success {
                completion(success,nil)
            }else {
                completion(false,error)
            }
        }
    }
    
    static func checkIfEmailExistWithEmail(email:String ,completion:@escaping(Bool,Error?)->()) {
        let parameter = ["email":email]
        let url = URLStrings.checkIfEmailIsFree
        postRequest(urlString: url, parameters: parameter, method: .post, headers: nil) { (success, error, response) in
            if success {
                completion(success,nil)
            }else {
                completion(false,error)
            }
        }
    }
}
