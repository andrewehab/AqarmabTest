//
//  UICollectionViewExtention.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UICollectionView {
    
    // MARK: Cell Selected
    public func cellSelected<T>(_ modelType: T.Type) -> ControlEvent<(T, IndexPath)> {
        ControlEvent(events: Observable.zip(
            self.modelSelected(modelType),
            self.itemSelected
        ))
    }
    
}
