//
//  CollectionView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 25/12/2018.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

import UIKit
import Stevia

// Get the full documentation at https://github.com/freshOS/Stevia

class CollectionView: UIView {
    
    // MARK:- Properties:
 
    
    lazy var collectionView : UICollectionView = {
        
    
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.sectionHeadersPinToVisibleBounds = true
        
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 35)
        flowLayout.sectionInset = UIEdgeInsets(top: 4.0, left: 0.0, bottom: 4.0, right: 0.0)
        // Mark: Determine Cell-Width, height depends on Cell-setupConstraints() or layoutupdate()
        flowLayout.estimatedItemSize = CGSize(width: screenWidth, height: 1)
        flowLayout.sectionHeadersPinToVisibleBounds = false
        
//        collectionView.backgroundColor = UIColor.darkGray // UIColor(r: 176, g: 176, b: 176)

        return collectionView
    }()
    
    
    

    convenience init() {
        self.init(frame: CGRect.zero)
        sv(collectionView)
//        collectionView.backgroundColor = UIColor.green
//        collectionView.collectionViewLayout.collectionView?.backgroundColor = UIColor.blue
        setupConstraints()
//        collectionView.fillContainer()

    }
    
    private func setupConstraints() {
        layout(
            40
            ,|-16-collectionView-16-|
            ,40
            
        )
    }
}

extension CollectionView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        return collectionView.collectionViewLayout.collectionViewContentSize
    }
}
