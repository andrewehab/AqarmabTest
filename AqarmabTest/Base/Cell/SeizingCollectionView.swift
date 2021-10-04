//
//  SeizingCollectionView.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit

class SeizingCollectionCell: UICollectionViewCell {
    
    
    //MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    //MARK: - For Resizing Cell
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        
        return layoutAttributes
    }
    
}
