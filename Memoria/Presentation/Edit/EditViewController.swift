//
//  EditViewController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/11.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class EditViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        // Do any additional setup after loading the view.
    }
    
    override func configureView() {
        view.addSubview(baseView)
    }
    
    override func configureLayout() {
        baseView.snp.makeConstraints {
            $0.leading.equalTo(view)
            $0.trailing.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(view)
        }
    }
    
    
    
    
    
    //MARK: UI
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let completeButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    



}
