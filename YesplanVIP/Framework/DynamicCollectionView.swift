//
//  DynamicCollectionView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 06/01/2019.
//  Copyright © 2019 Yesplan. All rights reserved.
//

import Foundation

import UIKit
import Stevia


class DynamicCollectionView: UICollectionView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
    
//    let flowLayout = UICollectionViewFlowLayout()
//    
//    flowLayout.sectionHeadersPinToVisibleBounds = true
//    
//    
//    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
//    let screenSize = UIScreen.main.bounds
//    let screenWidth = screenSize.width
//    
//    flowLayout.scrollDirection = .vertical
//    flowLayout.minimumLineSpacing = 10
//    flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 35)
//    flowLayout.sectionInset = UIEdgeInsets(top: 4.0, left: 0.0, bottom: 4.0, right: 0.0)
//    // Mark: Determine Cell-Width, height depends on Cell-setupConstraints() or layoutupdate()
//    flowLayout.estimatedItemSize = CGSize(width: screenWidth, height: 1)
//    flowLayout.sectionHeadersPinToVisibleBounds = false
//    
}
