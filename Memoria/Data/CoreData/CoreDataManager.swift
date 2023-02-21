//
//  CoreDataManager.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/21.
//

import Foundation
import CoreData


class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager()
    
    override init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MemoriaApp")
        container.loadPersistentStores(completionHandler: {(_,error) in
            if let error = error {
                fatalError("error--->\(error.localizedDescription)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error
                fatalError("saveContext Error----> \(error)")
            }
        }
    }
    
    func create(newMemoria: Memoria) -> (Bool,Error?) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        let memoria = MemoriaData(context: managedContext)
        
        
        do {
             try managedContext.save()
             return (true, nil)
           } catch let error as NSError {
             print("Could not save. \(error), \(error.userInfo)")
             return (false, error)
           }
    }
    
    func delete(id: UUID) -> (Bool,Error?) {
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MemoriaData")
        fetchRequest.returnsDistinctResults = false
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            
            for result in results {
                if let managedObject = result as? NSManagedObject {
                    managedContext.delete(managedObject)
                }
            }
        } catch let error {
            print("Delete Error-->\(error)")
            return (false,error)
        }
        
        do {
            try managedContext.save()
            return (true,nil)
        } catch let error {
            return (false,error)
        }
    }
    
//    func update(memoria: Memoria) -> (Bool,Error?) {
//        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
//        
//    }
//    
//    func reset() {
//        let container = persistentContainer
//        let coordinator = container.persistentStoreCoordinator
//        
//        if let store = coordinator.destroyPersistentStore(type: NSSQLiteStoreType) {
//            do {
//                try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: store.url)
//            } catch let error {
//                print(error)
//            }
//        }
//    }
    
    
    
    
    
}
