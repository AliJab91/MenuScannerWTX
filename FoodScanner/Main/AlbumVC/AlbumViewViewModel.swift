//
//  AlbumViewViewModel.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/20/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import UIKit
class AlbumViewViewModel {
    var images = [ImageObject]()
    
    func getAllImages() ->[ImageObject]  {
        images = CoreDataFunctions.retrieveImages()
     return images
    }
    
    func numberOfRowsInSection() -> Int  {
        if let images = images.count as? Int {
            return images
        }else {
            return 0
        }
    }
    
    func NumberOfSections() -> Int {
        return 1
    }
    
    func returnImageByIndexpath(indexPath:Int) ->ImageObject {
        return images[indexPath]
    }
    
    func setTitle() -> String {
        return "Album"
    }
    
    func sizeForCell() -> CGSize {
          return CGSize(width: 150, height: 135)
    }
    
    func setCellLayout() -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 20, bottom: 10, right: 20)
    }
}
