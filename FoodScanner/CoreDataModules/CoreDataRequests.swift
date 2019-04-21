//
//  CoreDataRequests.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/20/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class CoreDataFunctions {
    static fileprivate let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static func saveImageById( image:UIImage)  {
        let context = appDelegate.persistentContainer.viewContext
        let newImage = NSEntityDescription.insertNewObject(forEntityName: "Images", into: context)
        let imageData =   image.pngData()
        var imageId:Int!
         let id = UserdefaultHelper.getImageId() as? Int
        do{
            try context.save()
            newImage.setValue(id, forKey: keys.imageId)
            newImage.setValue(imageData, forKey: keys.imageKey)
            UserdefaultHelper.incrementUserId()
         //   NotificationCenter.default.post(name: Notification.Name("successSave"), object: nil)
          //  UserDefaultHelper.saveUserId(userId: userId)
        }catch {
            print("failed to save")
        }
    }
    
    static func retrieveImages() -> [NSManagedObject] {
        let emptyArray = [NSManagedObject]()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Images")
        do {
            let fetchedResults = try context.fetch(request)
            if let user = fetchedResults as? [NSManagedObject]{
                return user
            }
        }catch {
            print("could not fetch")
        }
        return emptyArray
    }
    
   static func deleteImageById(id:Int)  {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Images")
        request.predicate = NSPredicate(format: "imageIdKey = %@",id)
        request.returnsObjectsAsFaults = false
        do {
            let fetchedData = try context.fetch(request)
            if let allUsers = fetchedData as? [NSManagedObject]{
                for user in allUsers {
                    context.delete(user)
                }
            }
        }catch {
        }
    }
}

enum keys {
    static var imageId = "imageIdKey"
    static let imageKey = "imageKey"
}
