//
//  Images.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/21/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import UIKit
struct ImageObject {
    var image:UIImage
    var imageId:Int
    init(image:UIImage, imageId:Int) {
        self.image = image
        self.imageId = imageId
    }
}
