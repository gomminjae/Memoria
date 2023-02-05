//
//  BaseViewController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureLayout()
        bindRx()

        // Do any additional setup after loading the view.
    }
    
    func bindRx() {}
    func configureLayout() {}
    func configureView() {}

}
