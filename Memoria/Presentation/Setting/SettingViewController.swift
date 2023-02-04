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
       // self.navigationController?.navigationBar.backgroundColor = .systemIndigo
        title = "Setting"
        view.addSubview(tableView)
        tableView.register(SettingCell.self, forCellReuseIdentifier: SettingCell.reusableIdentifier)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view)
            $0.trailing.equalTo(view)
            $0.bottom.equalTo(view)
        }
        
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        return view
    }()

}


extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.reusableIdentifier, for: indexPath) as? SettingCell else { return UITableViewCell() }
        cell.titleLabel.text = "Hello World!"
        return cell
    }
    
}
 
