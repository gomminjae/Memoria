//
//  BottomTabbarItem.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//
import UIKit

class BottomTabbarItem {
    
    var title: String
    var image: String
    var isSelected: Bool
    
    init(title: String, image: String, isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}
