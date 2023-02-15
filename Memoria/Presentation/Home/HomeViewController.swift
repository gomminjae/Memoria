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
import FSCalendar

struct SectionData {
    var header: UIView
    var items: [Item]
}
extension SectionData: SectionModelType {
    typealias Item = Memoria
    
    init(original: SectionData, items: [Item]) {
        self = original
        self.items = items
    }
}

class HomeViewController: BaseViewController {
    var disposeBag = DisposeBag()
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MemoriaCell.self, forCellWithReuseIdentifier: MemoriaCell.reusableIdentifier)
        configureNavBar()
        title = ""
        bindRx()
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
    private func configureNavBar() {
        self.navigationItem.rightBarButtonItem = profileButton
    }
    
    
    private func bindRx() {
        
        viewModel.dummyList
            .bind(to: collectionView.rx.items(cellIdentifier: MemoriaCell.reusableIdentifier,cellType: MemoriaCell.self)) { index, model, cell in
                cell.titleLabel.text = model.title
                cell.contentLabel.text = model.content
            }
            .disposed(by: disposeBag)
        
    }
    //MARK: UI👽
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: self.view.bounds.width-10, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .offWhite
        collectionView.register(CalendarView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CalendarView.reusableIdentifier)
        //view.dataSource = self
        //view.delegate = self
        return  collectionView
    }()
    
    let profileButton: UIBarButtonItem = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.tintColor = .systemYellow
        button.frame = CGRectMake(0, 0, 50, 50)
        return UIBarButtonItem(customView: button)
    }()
}

extension HomeViewController {
    
//    private func generateLayout() -> UICollectionViewLayout {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        let groupSize
//    }

}

