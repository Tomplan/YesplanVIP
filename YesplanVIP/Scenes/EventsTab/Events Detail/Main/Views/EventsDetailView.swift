//
//  EventsDetailView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

import UIKit
import Stevia

// Get the full documentation at https://github.com/freshOS/Stevia

class EventsDetailView: UIView {
    
    // MARK:- Properties:
    let refreshControl = UIRefreshControl()
    let spinner = UIActivityIndicatorView(style: .gray)
    
    lazy var collectionView : UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        
        flowLayout.sectionHeadersPinToVisibleBounds = true
        
        

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 2
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 35)
        flowLayout.sectionInset = UIEdgeInsets(top: 4.0, left: 0.0, bottom: 4.0, right: 0.0)
        // Mark: Determine Cell-Width, height depends on Cell-setupConstraints()
        flowLayout.estimatedItemSize = CGSize(width: screenWidth, height: 1)
        flowLayout.sectionHeadersPinToVisibleBounds = true

        collectionView.backgroundColor = UIColor.black // UIColor(r: 176, g: 176, b: 176)
        
        //        let cellHeight: CGFloat = 75
        //        let size: CGSize = CGSize(width: screenWidth, height: cellHeight)
        //        flowLayout.itemSize = CGSize(width: collectionView.frame.size.width, height: 100)
        //        flowLayout.itemSize = size
        return collectionView
    }()
    
    //    let backgroundImageView: UIImageView = {
    //        let iv = UIImageView()
    //        iv.contentMode = .scaleAspectFill
    //        iv.image = UIImage(named: "yesplanNB 1024x1024")
    //        return iv
    //    }()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        sv(collectionView)
        collectionView.fillContainer()
        collectionView.addSubview(refreshControl)
        collectionView.addSubview(spinner)
        collectionView.register(EventsDetailViewCell.self, forCellWithReuseIdentifier: "EventsDetailViewCell")
        collectionView.register(EventsDetailViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "EventsDetailViewHeader")
    }
    
}

