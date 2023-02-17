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
    
    let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String,Memoria>>(configureCell: {(dataSource, collectionView, indexPath, item) -> UICollectionViewCell in
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemoriaCell.reusableIdentifier, for: indexPath) as? MemoriaCell else { return UICollectionViewCell() }
        cell.titleLabel.text = item.title
        cell.contentLabel.text = item.content
        return cell
    })
    

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
        
        dataSource.configureSupplementaryView = { (dataSource, collectionView, kind, indexPath) -> UICollectionReusableView in
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CalendarView.reusableIdentifier, for: indexPath) as? CalendarView else { return UICollectionReusableView() }
                
                return header
            }else {
                return UICollectionReusableView()
            }
            
        }
        viewModel.dummyList
            .map { itemViewModel -> [SectionModel<String, Memoria>] in
                return [SectionModel(model: "", items: itemViewModel)]
            }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        collectionView.rx.setDelegate(self)
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


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}


