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
        let newImage = NSEntityDescription.insertNewObject(forEntityName: keys.entityName, into: context)
        let imageData =   image.pngData()
        var imageId:Int!
         let id = UserdefaultHelper.getImageId() as? Int
        newImage.setValue(id, forKey: keys.imageId)
        newImage.setValue(imageData, forKey: keys.imageKey)
        do{
            UserdefaultHelper.incrementUserId()
              try context.save()
         //   NotificationCenter.default.post(name: Notification.Name("successSave"), object: nil)
          //  UserDefaultHelper.saveUserId(userId: userId)
        }catch {
            print("failed to save")
        }
    }
    
    static func retrieveImages() -> [ImageObject] {
        let emptyArray = [NSManagedObject]()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:keys.entityName)
        do {
            let fetchedResults = try context.fetch(request)
            if let images = fetchedResults as? [NSManagedObject]{
                var array = [ImageObject]()
                for image in images {
                    if let imageId = image.value(forKey: keys.imageId) as? Int {
                    if let imageAsImg = (image.value(forKey: keys.imageKey) as? Data)  {
                        let imageObject = ImageObject(image: UIImage(data:imageAsImg )!, imageId: imageId)
                        
                       
                        array.append(imageObject)
                    }
                }
                }
                return array
            }//locations = context.executeFetchRequest(fetchRequest, error: nil) as [Locations]
        }catch {
            print("could not fetch")
        }
        return []
    }
    
   static func deleteImageById(id:Int)  {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: keys.entityName)
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
    static var entityName = "Images"
    static var imageId = "imageIdKey"
    static let imageKey = "imageKey"
}
