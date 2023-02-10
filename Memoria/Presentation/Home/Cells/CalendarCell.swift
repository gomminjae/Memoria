//
//  CalendarCell.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/10.
//
import UIKit
import SnapKit


class CalendarCell: UICollectionViewCell {
    
    enum Section {
        case calendar
        case memoria
    }
    
    
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .systemYellow
        
        addSubview(dateLabel)
        addSubview(dayLabel)
        
        dateLabel.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.centerY.equalTo(self)
        }
        dayLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(self)
        }
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
