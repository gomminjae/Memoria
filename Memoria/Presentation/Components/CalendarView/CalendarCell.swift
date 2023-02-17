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
        self.backgroundColor = .systemYellow
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        setupview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupview() {
        addSubview(dateLabel)
        addSubview(dayLabel)
        dateLabel.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(self)

        }
        
        dayLabel.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(dateLabel.snp.bottom)
            $0.bottom.equalTo(self)
        }
    }
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "MON"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "28"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
}
