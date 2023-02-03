//
//  CustomTabbarController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//

import UIKit
import SnapKit 

class CustomTabbarController: UITabBarController {
    
    
    var currentIndex: Int = 0 
    
    lazy var tabs: [TabBarItemView] = {
        var items = [TabBarItemView]()
        for _ in 0..<4 {
            items.append(TabBarItemView())
        }
        return items
    }()
    
    lazy var tabModels: [BottomTabbarItem] = {
        return [
            BottomTabbarItem(title: "Home", image: "house"),
            BottomTabbarItem(title: "Favorites", image: "heart"),
            BottomTabbarItem(title: "Search", image: "magnifyingglass"),
            BottomTabbarItem(title: "Profile", image: "person"),
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabIndex()
        setupVC()
        // Do any additional setup after loading the view.
    }
    
    private func setupVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        //1
        let navVC = UINavigationController(rootViewController: HomeViewController())
        navVC.title = "Memoria"
        viewControllers = [navVC]
    }
    
    private func setupTabBar() {
        
        tabBar.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(tabBar)
            $0.leading.equalTo(tabBar).inset(15)
            $0.trailing.equalTo(tabBar).inset(15)
            $0.bottom.equalTo(self.view.safeAreaInsets)
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

