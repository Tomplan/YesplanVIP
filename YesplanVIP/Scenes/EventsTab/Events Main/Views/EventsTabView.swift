//
//  EventsTabView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia
import UserNotifications

// Get the full documentation at https://github.com/freshOS/Stevia

class EventsTabView: UIView {

    // MARK:- Properties:
    let refreshControl = UIRefreshControl()
//    let spinner = UIActivityIndicatorView(style: .gray)
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    lazy var collectionView : UICollectionView = {
        
        
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 2
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 35)
        flowLayout.sectionInset = UIEdgeInsets(top: 4.0, left: 0.0, bottom: 4.0, right: 0.0)
        flowLayout.estimatedItemSize = CGSize(width: screenWidth, height: 10)
//        flowLayout.sectionHeadersPinToVisibleBounds = true
        collectionView.alwaysBounceVertical = true
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
//        collectionView.addSubview(spinner)
        collectionView.register(EventsTabViewCell.self, forCellWithReuseIdentifier: "EventsTabViewCell")
        collectionView.register(EventsTabViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "EventsTabViewHeader")
    }
    
}
  
