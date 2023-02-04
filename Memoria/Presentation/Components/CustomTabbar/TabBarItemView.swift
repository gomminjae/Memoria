//
//  TabBarItemView.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//

import UIKit
import SnapKit

protocol TabBarItemViewDelegate: AnyObject {
    func tapped(_ view: TabBarItemView)
}


class TabBarItemView: UIView {
    
    
    weak var delegate: TabBarItemViewDelegate?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .lightGray
        setupView()
        self.addTapGesture()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        self.addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isSelected: Bool = false {
        willSet {
            self.render(isSelected: newValue)
        }
    }
    
    var item: Any? {
        didSet {
            self.configure(self.item)
            
        }
    }
    private func configure(_ item: Any?) {
        guard let model = item as? BottomTabbarItem else { return }
        self.tabBarImage.image = UIImage(named: model.image)
        self.titleLabel.text = model.title
        self.isSelected = model.isSelected
    }
    
    private func render(isSelected: Bool) {
        guard let model = item as? BottomTabbarItem else { return }
        model.isSelected = isSelected
        
        let animationOptions: UIView.AnimationOptions = isSelected ? [.curveEaseIn] : [.curveEaseOut]
        
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.5,
                       options: animationOptions,
                       animations: {
            self.titleLabel.text = isSelected ? model.title : ""
            let color: UIColor = isSelected ? .systemIndigo : .brown
            self.highlightView.backgroundColor = color
            (self.superview as? UIStackView)?.layoutIfNeeded()
        },completion: nil)
        
    }
    
    private func setupView() {
        addSubview(highlightView)
        highlightView.addSubview(tabBarImage)
        highlightView.addSubview(titleLabel)
        
        titleLabel.backgroundColor = .red
        //tabBarImage.backgroundColor = .black
        
        highlightView.snp.makeConstraints {
            $0.leading.equalTo(self).inset(5)
            $0.trailing.equalTo(self)
            $0.top.equalTo(self).inset(5)
            $0.bottom.equalTo(self).inset(5)
        }
        tabBarImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(highlightView)
            $0.trailing.equalTo(titleLabel.snp.leading)
            $0.height.equalTo(34)
            $0.width.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(highlightView).inset(5)
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    let tabBarImage: UIImageView = {
        let view = UIImageView()
        //view.backgroundColor = .white
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "person.fill")
        return view
    }()
    let highlightView: UIView = {
        let view = UIView()
        return view
    }()
}


extension TabBarItemView {
    func addTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(configGesture))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func configGesture(_ sender: UIGestureRecognizer) {
        self.delegate?.tapped(self)
    }
}
