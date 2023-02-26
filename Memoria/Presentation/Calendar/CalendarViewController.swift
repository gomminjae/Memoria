//
//  CalendarViewController.swift
//  Memoria
//
//  Created by 권민재 on 2023/02/17.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

class CalendarViewController: BaseViewController {
    
    private var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calendar"

        // Do any additional setup after loading the view.
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
    //MARK: UI
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .systemYellow
        return view
    }()
}

extension CalendarViewController {
    
    private func generateLayout() -> UICollectionViewLayout {
        return UICollectionViewLayout()
    }
}
