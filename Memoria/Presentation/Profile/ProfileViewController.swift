 //
//  ProfileViewController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/13.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue 
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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    

}
extension ProfileViewController {
    
    func generateLayout() -> UICollectionViewLayout {
        return UICollectionViewLayout()
    }
}
