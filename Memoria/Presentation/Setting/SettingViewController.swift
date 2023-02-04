//
//  SettingViewController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/04.
//

import UIKit

class SettingViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .systemIndigo
        title = "Setting"

        // Do any additional setup after loading the view.
    }
    

    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        return view
    }()

}
