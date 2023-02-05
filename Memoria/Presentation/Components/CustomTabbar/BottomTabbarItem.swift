//
//  BottomTabbarItem.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//
import UIKit

class BottomTabbarItem {
    
    var title: String
    var imageString: String
    var isSelected: Bool
    
    init(title: String, imageString: String, isSelected: Bool = false) {
        self.title = title
        self.imageString = imageString
        self.isSelected = isSelected
    }
}
