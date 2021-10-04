//
//  CollectionViewController.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit
import RxSwift
import RxCocoa

class CustomCollectionViewController: CustomNavigationViewController {
    
    //MARK: - Propertise
    let disposeBag = DisposeBag()
    
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


// MARK: - General Functions For Collection View Using RX Swift
extension CustomCollectionViewController {
    
    // MARK: Configure Collection View Cell
    func configureCollectionViewCell<T: Sequence>(items: BehaviorRelay<T>, collectionView: UICollectionView, collectionCellIdentifier: String, completion: @escaping(Int, T.Element, UICollectionViewCell)-> Void) {
        items
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView.rx.items(cellIdentifier: collectionCellIdentifier, cellType: UICollectionViewCell.self), curriedArgument: { row, objectData, cell in
                completion(row, objectData, cell)
            }).disposed(by: disposeBag)
    }
    
    
    // MARK: Configure Selecting On Collection View Cell
    func configureSelectingOnCollectionViewCell<T: Any>(collectionView: UICollectionView, selectedModule: T.Type, completion: @escaping(T, IndexPath)-> Void) {
        collectionView.rx.cellSelected(T.self).subscribe(onNext: { selectedLObject, indexPath in
            completion(selectedLObject, indexPath)
        }).disposed(by: disposeBag)
    }
    
    
    // MARK: Configure Specific Collection View Cell
    func configureSpecificCollectionViewCell<T: UICollectionViewCell>(collectionView: UICollectionView, indexPathRow: Int, completion: (T)-> Void) {
        guard let cell = collectionView.cellForItem(at: IndexPath(row: indexPathRow, section: 0)) as? T  else { return }
        completion(cell)
    }
    
    
    // MARK: Configure Collection View Pagination
    func configureCollectionViewPagination<T: UICollectionViewCell>(collectionView: UICollectionView, completion: @escaping(T, IndexPath)-> Void) {
        collectionView.rx
            .willDisplayCell
            .subscribe(onNext: { cell, indexPath in
                guard let cell = cell as? T else { return }
                completion(cell, indexPath)
            }).disposed(by: disposeBag)
    }
    
}
