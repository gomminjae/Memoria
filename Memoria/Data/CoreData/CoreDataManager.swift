//
//  CoreDataManager.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/12.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager()
    
    override init() {
        super.init()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Memoria")
        container.loadPersistentStores(completionHandler: { (_ ,error) in
            if let error = error {
                fatalError("Persistent Error")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }catch {
                let error = error
                fatalError()
            }
        }
    }
    
    
//    func delete(memoria: Memoria) {
//        persistentContainer.viewContext.delete(memoria)
//        do {
//            try persistentContainer.viewContext.save()
//        }catch {
//            persistentContainer.viewContext.rollback()
//            print("Fail to delete context \(error.localizedDescription)")
//        }
//    }
//    
//    func getAllMemorias() -> [Memoria] {
//    }
    
   
    
}
