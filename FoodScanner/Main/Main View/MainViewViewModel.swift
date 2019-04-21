//
//  MainViewViewModel.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/14/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import UIKit

class MainViewViewModel {
    var mainViewViewModel:MainViewViewModel!
    var collectionViewItems = [IconDetails]()
    func fillCollectionItems()  {
        collectionViewItems.append(IconDetails(name: "Take a picture", image: UIImage(named: "TakeAnImage")!))
         collectionViewItems.append(IconDetails(name: "Check your album", image: UIImage(named: "Album")!))
         collectionViewItems.append(IconDetails(name: "About us", image: UIImage(named: "aboutUs")!))
         collectionViewItems.append(IconDetails(name: "Logout", image: UIImage(named: "Logout")!))
    }
    
    func returnItem(for index:Int ,with section:Int) -> IconDetails {
        if section == 1 {
        return collectionViewItems[index + 2]
        }else {
            return collectionViewItems[index]
        }
    }
    
    func numberOfSections() -> Int {
        return 2
    }
    func numberOfItemsInSection() -> Int {
        return 2
    }
}
