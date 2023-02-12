//
//  HomeViewModel.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/04.
//

import Foundation
import RxSwift


protocol ViewModelType {
    associatedtype Input
    associatedtype Output
}

protocol HomeViewModelType {
    var memoriaList: BehaviorSubject<[Memoria]> { get }
    var dateState: Observable<[Bool]> { get }

}

class HomeViewModel {
    
    let dummyList = Observable.just([
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎")
    ])
    
    var disposeBag = DisposeBag()
    
  
    init() {}
    
    
    
}
