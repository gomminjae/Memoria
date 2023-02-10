//
//  SettingCell.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/04.
//

import UIKit
import SnapKit

class SettingCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        
        addSubview(baseView)
        baseView.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.leading.equalTo(self)
            $0.trailing.equalTo(self)
            $0.bottom.equalTo(self)
        }
        baseView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(self).inset(20)
        }
    }
    
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Hello world!"
        return label
    }()

}
