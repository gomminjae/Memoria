//
//  HomeViewModel.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/04.
//

import Foundation
import RxSwift
import RxCocoa


protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}

protocol HomeViewModelType {
    var memoriaList: BehaviorSubject<[Memoria]> { get }
    var dateState: Observable<[Bool]> { get }

}

class HomeViewModel: ViewModelType {
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    var disposeBag = DisposeBag()
    
    
    
    let dummyList = Observable.just([
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
        Memoria(title: "Hello world!", content: "Let's Swift🍎"),
    ])
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
  
    init() {}
    
    
    
}
