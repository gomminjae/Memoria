//
//  CoreDataModel.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/05.
//

import Foundation
import CoreData
import RxSwift


protocol CoreDataModelInput {
    func getMemorias()
    
}

protocol CoreDataModelOutput {
    var memorias: Observable<Memoria> { get }
    
}

class CoreDataModel {
    
    private let disposeBag = DisposeBag()
    
    
}
