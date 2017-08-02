//
//  CircularCollectionViewLayout.swift
//  ImGame
//
//  Created by Edward Anchundia on 8/1/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit

class CircularCollectionViewLayout: UICollectionViewLayout {
    let itemSize = CGSize(width: 133, height: 173)
    
    var radius: CGFloat = 500 {
        didSet {
            invalidateLayout()
        }
    }
    
    var anglePerItem: CGFloat {
        return atan(itemSize.width / radius)
    }
    
//    override func collectionViewContentSize() -> CGSize {
//        
//        return CGSize(width: CGFloat(collectionView!.numberOfItemsInSection(0)) * itemSize.width,
//                      height: CGRectGetHeight(collectionView!.bounds))
//        return CGSize(width: CGFloat((collectionView?.numberOfItems(inSection: 0))!) * itemSize.width, height: )
//    }

}
