//
//  MemoriaUseCase.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/05.
//

import Foundation
import RxSwift

class MemoriaUseCase {
    private let coreDataRepository: CoreDataRepositoryType
    
    init(coreDataRepository: CoreDataRepositoryType) {
        self.coreDataRepository = coreDataRepository
    }
}
