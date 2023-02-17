//
//  HeaderView.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/07.
//

import UIKit
import SnapKit

class CalendarView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemPink
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(baseView)
        
        baseView.snp.makeConstraints {
            $0.top.equalTo(self).inset(20)
            $0.leading.equalTo(self).inset(10)
            $0.trailing.equalTo(self).inset(10)
            $0.bottom.equalTo(self).inset(20)
        }
    }
    
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let previousButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        button.tintColor = .systemYellow
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        return button
    }()
    
    let datePageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
}
