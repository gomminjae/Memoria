//
//  MemoriaCell.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/10.
//

import UIKit
import SnapKit

class MemoriaCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemYellow
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(contentLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.leading.equalTo(self).inset(20)
            // $0.trailing.equalTo(self)
        }
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(self)
        }
    }
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
}
