//
//  IconDetails.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/20/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import UIKit
struct IconDetails {
    var name:String
    var iconImage:UIImage
    init(name:String,image:UIImage) {
        self.name = name
        self.iconImage = image
    }
}
