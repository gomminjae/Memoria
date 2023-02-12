//
//  CalendarCell.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/12.
//

import UIKit
import SnapKit

class CalendarCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dayLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}
