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
        view.backgroundColor = .lightGray
        title = "Setting"

        // Do any additional setup after loading the view.
    }
    

    let tableView: UITableView = {
        let view = UITableView()
        return view
    }()

}
