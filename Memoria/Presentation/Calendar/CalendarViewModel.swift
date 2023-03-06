//
//  CalendarViewModel.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/17.
//

import Foundation
import RxSwift
import RxCocoa

protocol CalendarViewModelBindable {
    var memorias: Observable<[Memoria]> { get }
    var state: Driver<Void> { get set }
}
protocol CalendarViewInput {
    
}

protocol CalendarViewOutput {
    
}

class CalendarViewModel {
    
    var disposeBag = DisposeBag()
    
}
