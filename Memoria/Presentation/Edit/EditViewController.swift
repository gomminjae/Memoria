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
    
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        bindRx()

        // Do any additional setup after loading the view.
    }
    
    override func configureView() {
        view.addSubview(baseView)
        baseView.addSubview(titleLabel)
        baseView.addSubview(cancelButton)
        baseView.addSubview(completeButton)
    }
    
    override func configureLayout() {
        baseView.snp.makeConstraints {
            $0.leading.equalTo(view)
            $0.trailing.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(view)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(baseView).inset(40)
            $0.leading.equalTo(baseView).inset(20)
        }
        cancelButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(15)
            $0.top.equalTo(titleLabel.snp.top)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(baseView).inset(40)
            $0.centerX.equalTo(baseView)
            $0.width.equalTo(100)
        }
    }
    
    private func bindRx() {
        
        cancelButton.rx
            .tap
            .bind {
                self.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
        
        completeButton.rx
            .tap
            .bind {
                self.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
    }
    //MARK: UI
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .offWhite
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Memoria 추가하기"
        label.font = UIFont.monospacedSystemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.tintColor = .systemYellow
        return button
    }()
    
    let completeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        return button
    }()
    
    
    



}
