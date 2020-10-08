//
//  CoreDataOperation.swift
//  NST
//
//  Created by TIAN TONG on 10/8/20.
//

import Foundation
import CoreData

class CoreDataOperation {
    
    static func queryObjects(entityName: String, context: NSManagedObjectContext) -> [Any]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            return try context.fetch(request)
        } catch {
            NSLog("Core Data Fetch Error: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    static func delete(object: NSManagedObject, context: NSManagedObjectContext) {
        context.delete(object)
        CoreDataManager.shared.saveContext()
    }
    
    static func batchDelete(entityName: String, context: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
        } catch {
            NSLog("Core Data Batch Delete Error: \(error.localizedDescription)")
        }
    }
    
}
