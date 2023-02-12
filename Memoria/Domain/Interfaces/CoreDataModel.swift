//
//  CoreDataRepositoryType.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/05.
//

import CoreData
import Foundation
import RxSwift


protocol CoreDataModelType {
    var memories: PublishSubject<[Memoria]> { get }
    func getMemorias()
    func create(memoria: Memoria) -> (Bool,Error?)
    func update(updated: Memoria) -> (Bool,Error?)
    func delete(id: UUID) -> (Bool,Error?)
}



class CoreDataModel: CoreDataModelType {
    
    
    var memories: PublishSubject<[Memoria]>
    
    
}
