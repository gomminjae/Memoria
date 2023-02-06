//
//  HomeViewController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//

import UIKit
import SnapKit
import RxSwift
import RxDataSources

class HomeViewController: BaseViewController {
    
    var disposeBag = DisposeBag() 

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemBlue
        title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func configureView() {
        view.addSubview(collectionView)
    }
    
    override func configureLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view)
            $0.trailing.equalTo(view)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func bindRx() {
        
    }
    
    
    
    //MARK: UI👽
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .systemYellow
        return view
    }()
    
    
    

   
}
