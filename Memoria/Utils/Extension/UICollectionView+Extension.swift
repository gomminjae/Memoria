//
//  UICollectionView+Extension.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/19.
//

import UIKit
import SnapKit

extension UICollectionView {
    
    func setupEmptyView() {
        let emptyView = EmptyDataView()
        self.backgroundView = emptyView
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
