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
    var input: Input
    var output: Output
    
    func transform(input: Input) -> Output
}

class HomeViewModel: ViewModelType {
    
    var input: Input
    var output: Output
    
    
    struct Input {
        var memorias: Observable<[Memoria]>
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
    init() {}
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
    
    
    
    
    
    
    
    
}
