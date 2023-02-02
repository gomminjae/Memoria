//
//  HomeViewController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/02.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func configureView() {
        <#code#>
    }
    
    override func configureLayout() {
        <#code#>
    }
    
    
    //MARK: UI👽
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return view
    }()
    
    
    

   
}
