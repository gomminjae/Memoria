//
//  HomeViewModel.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/04.
//

import Foundation
import RxSwift

protocol HomeViewModelBindable {
    associatedtype Input
    associatedtype Output
}

class HomeViewModel: HomeViewModelBindable {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
}
