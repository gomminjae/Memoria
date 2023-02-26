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
        print("init")
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        backgroundColor = .white
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
        view.backgroundColor = .white
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 추가된 데이터가 없읍니다"
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "데이터를 추가해 보기겠읍니까?"
        return label
    }()
    
    let emptyView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    
    
}
