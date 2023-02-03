//
//  CustomTabbarController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//

import UIKit
import SnapKit 

class CustomTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    
    var currentIndex = 0
    
    lazy var tabs: [TabBarItemView] = {
        var items = [TabBarItemView]()
        for _ in 0..<4 {
            items.append(TabBarItemView())
        }
        return items
    }()
    
    lazy var tabModels: [BottomTabbarItem] = {
        return [
            BottomTabbarItem(title: "Home", image: "home"),
            BottomTabbarItem(title: "Favorites", image: "heart"),
            BottomTabbarItem(title: "Search", image: "search"),
            BottomTabbarItem(title: "Profile", image: "user"),
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabIndex()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .white
        //tabBar.layer.cornerRadius = tabBar.frame.height * 0.5
        //tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        //tabBar.backgroundColor = .systemIndigo
        
        tabBar.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            //$0.height.equalTo(tabBar)
            $0.left.equalTo(tabBar).inset(15)
            $0.right.equalTo(tabBar).inset(15)
            $0.top.equalTo(tabBar)
            $0.bottom.equalTo(tabBar.safeAreaLayoutGuide)
        }
    }
    private func setupTabIndex() {
        for (index,model) in self.tabModels.enumerated() {
            let itemView = self.tabs[index]
            model.isSelected = index == 0
            itemView.item = model
            itemView.delegate = self
            self.stackView.addArrangedSubview(itemView)
        }
    }
    
    let stackView: UIStackView = {
        let view = UIStackView()
        //view.backgroundColor = .systemIndigo
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 0
        return view
    }()
    
}

extension CustomTabbarController: TabBarItemViewDelegate {
    func tapped(_ view: TabBarItemView) {
        self.tabs[self.currentIndex].isSelected = false
        view.isSelected = true
        self.currentIndex = self.tabs.firstIndex(where: {$0===view}) ?? 0
    }
}
