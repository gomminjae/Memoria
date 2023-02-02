//
//  ReusableIdentifier.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//

import Foundation


extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
