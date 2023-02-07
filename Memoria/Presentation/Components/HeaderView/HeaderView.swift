//
//  HeaderView.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/07.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let baseView: UIView = {
        let view = UIView()
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
}
