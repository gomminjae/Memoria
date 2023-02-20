//
//  MemoriaData+CoreDataProperties.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/21.
//
//

import Foundation
import CoreData


extension MemoriaData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoriaData> {
        return NSFetchRequest<MemoriaData>(entityName: "MemoriaData")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension MemoriaData : Identifiable {

}
