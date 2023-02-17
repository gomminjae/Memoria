//
//  CalendarViewModel.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/17.
//

import Foundation
import RxSwift

protocol CalendarViewModelBindable {
    var memorias: Observable<[Memoria]> { get }
}


class CalendarViewModel {
    
    var disposeBag = DisposeBag()
    
}
