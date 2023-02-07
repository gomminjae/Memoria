//
//  EmptyDataView.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/07.
//

import UIKit
import SnapKit

class EmptyDataView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(baseView)
        baseView.addSubview(titleLabel)
        baseView.addSubview(subTitleLabel)
        
        baseView.snp.makeConstraints {
            $0.top.equalTo(self).inset(10)
            $0.leading.equalTo(self).inset(10)
            $0.trailing.equalTo(self).inset(10)
            $0.bottom.equalTo(self).inset(10)
        }
        
        
    }
    
    //MARK: UI
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let emptyView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    
    
}
