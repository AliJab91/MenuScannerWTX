//
//  LoginViewViewModel.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/14/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import UIKit
class LoginViewViewModel {
    
    var isLoading :((Bool) ->())?
    var didFinishFetching: ((_ error:Error?) ->())?
   
}
