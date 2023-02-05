//
//  HomeViewModel.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/04.
//

import Foundation
import RxSwift
import RxCocoa


protocol HomeViewModelType {
    associatedtype Input
    associatedtype Output
}

class HomeViewModel: HomeViewModelType {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    init() {}
    
    
    
}
