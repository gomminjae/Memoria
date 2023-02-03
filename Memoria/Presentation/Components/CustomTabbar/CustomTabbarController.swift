//
//  CustomTabbarController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//

import UIKit
import SnapKit 

class CustomTabbarController: UIViewController {
    
    
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
    
    var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabIndex()
        //setupVC()
        if currentIndex == 0 {
            setupVC(HomeViewController.reusableIdentifier)
            
        }
        
        // Do any additional setup after loading the view.
    }

    
    private func setupTabBar() {
        
        view.addSubview(baseView)
        
        baseView.snp.makeConstraints {
            $0.bottom.equalTo(view)
            $0.leading.equalTo(view)
            $0.trailing.equalTo(view)
            $0.height.equalTo(view).multipliedBy(0.12)
        }
        
        baseView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(baseView)
            $0.leading.equalTo(baseView).inset(15)
            $0.trailing.equalTo(baseView).inset(15)
            $0.bottom.equalTo(view.safeAreaInsets)
        }
        
        view.addSubview(containerView)
        containerView.backgroundColor = .black
        containerView.snp.makeConstraints {
            $0.top.equalTo(view)
            $0.leading.equalTo(view)
            $0.trailing.equalTo(view)
            $0.bottom.equalTo(baseView.snp.top)
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
    
    private func setupVC(_ name: String) {
        let vc = main.instantiateViewController(withIdentifier: name)
        addChild(vc)
        containerView.addSubview(vc.view)
        vc.view.frame = containerView.frame
    }
    
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        //view.backgroundColor = .systemIndigo
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 0
        return view
    }()
    
    let containerView = UIView() 
    
    
}

extension CustomTabbarController: TabBarItemViewDelegate {
    func tapped(_ view: TabBarItemView) {
        self.tabs[self.currentIndex].isSelected = false
        view.isSelected = true
        self.currentIndex = self.tabs.firstIndex(where: {$0===view}) ?? 0
        
        if currentIndex == 0 {
            setupVC(HomeViewController.reusableIdentifier)
        }
        else if currentIndex == 1 {
            setupVC("Setting")
        }
    }
}

