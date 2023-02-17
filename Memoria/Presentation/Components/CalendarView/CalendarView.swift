//
//  HeaderView.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/07.
//

import UIKit
import SnapKit
import RxSwift

class CalendarView: UICollectionReusableView {
    
    
    let days = ["MON","TUE","WED","THU","FRI","SAT","SUN"]
    private var disposeBag = DisposeBag()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .offWhite
        setupView()
        bindRx()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(baseView)
        
        baseView.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.leading.equalTo(self).inset(10)
            $0.trailing.equalTo(self).inset(10)
            $0.height.equalTo(self.frame.height / 4)
        }
        
        baseView.addSubview(previousButton)
        baseView.addSubview(nextButton)
        baseView.addSubview(monthLabel)
        
        previousButton.snp.makeConstraints {
            $0.leading.equalTo(baseView)
            $0.width.height.equalTo(50)
        }
        
        nextButton.snp.makeConstraints {
            $0.trailing.equalTo(baseView)
            $0.width.height.equalTo(50)
        }
        monthLabel.snp.makeConstraints {
            $0.top.equalTo(baseView)
            $0.leading.equalTo(previousButton.snp.trailing)
            $0.trailing.equalTo(nextButton.snp.leading)
            $0.centerY.equalTo(baseView)
        }
        
        addSubview(datePageCollectionView)
        datePageCollectionView.snp.makeConstraints {
            $0.top.equalTo(baseView.snp.bottom)
            $0.leading.trailing.equalTo(self)
            $0.bottom.equalTo(self)
        }
        
    }
    
    private func bindRx() {
        
        Observable.of(days)
            .bind(to: datePageCollectionView.rx.items(cellIdentifier: CalendarCell.reusableIdentifier,cellType: CalendarCell.self)) { row,model,cell in
                cell.dayLabel.text = "MON"
            }
            .disposed(by: disposeBag)
        
        
       
    }
    
    
    
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .offWhite
        return view
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        label.text = "December"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        return label
    }()
    
    let previousButton: UIButton = {
        let button = UIButton()
        //button.backgroundColor = .blue
        button.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        button.tintColor = .systemYellow
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
       //button.backgroundColor = .blue
        button.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        button.tintColor = .systemYellow
        button.contentMode = .scaleToFill
        button.configuration?.buttonSize = .large
        return button
    }()
    
    let datePageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 80, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CalendarCell.self, forCellWithReuseIdentifier: CalendarCell.reusableIdentifier)
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
}
