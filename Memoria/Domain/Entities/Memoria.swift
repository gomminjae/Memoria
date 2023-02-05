//
//  Memoria.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/05.
//
import Foundation


struct Memoria {
    let title: String?
    let content: String?
    //let id: UUID?
    var date: Date?
    
    init(title: String?, content: String?, date: Date? = nil) {
        self.title = title
        self.content = content
        self.date = date
    }
}
