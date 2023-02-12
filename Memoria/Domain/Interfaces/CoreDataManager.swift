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
        
    }
}
