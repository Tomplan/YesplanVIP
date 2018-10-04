//
//  EventsTabView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

// Get the full documentation at https://github.com/freshOS/Stevia

//class EventsTabView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
class EventsTabView: UIView {

    // MARK:- Properties:
    let refreshControl = UIRefreshControl()
    let spinner = UIActivityIndicatorView(style: .gray)

    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let cellHeight: CGFloat = 75
        let size: CGSize = CGSize(width: screenWidth, height: cellHeight)
//        flowLayout.itemSize = CGSize(width: collectionView.frame.size.width, height: 100)
        flowLayout.itemSize = size
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(EventsTabViewCell.self, forCellWithReuseIdentifier: "EventsTabViewCell")
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 40)
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "yesplanNB 1024x1024")
        return iv
    }()
    
    convenience init() {
    self.init(frame: CGRect.zero)

        sv(collectionView)
        collectionView.fillContainer()
        
        collectionView.addSubview(refreshControl)
        collectionView.addSubview(spinner)
        
        collectionView.register(EventsTabViewCell.self, forCellWithReuseIdentifier: "EventsTabViewCell")
        collectionView.register(EventsTabViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "EventsTabViewHeader")
    }
    
}
  
