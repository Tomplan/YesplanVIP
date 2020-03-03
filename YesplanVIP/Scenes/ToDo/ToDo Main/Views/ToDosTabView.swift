//
//  ToDosTabView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

// Get the full documentation at https://github.com/freshOS/Stevia

class ToDosTabView: UIView {
    
//    var toDoPrefsAction: (() -> Void)?

    // MARK:- Properties:
    let refreshControl = UIRefreshControl()
    let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
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
        
        collectionView.backgroundColor = UIColor.black
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
//    let backgroundImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "yesplanNB 1024x1024")
//        return iv
//    }()
    
//    let toDoPrefsButton: UIButton = {
//        let button = UIButton(title: "Login", borderColor: .greenBorderColor)
//        button.addTarget(self, action: #selector(handleToDoPrefs), for: .touchUpInside)
//        return button
//    }()
//
//    @objc func handleToDoPrefs() {
//        toDoPrefsAction?()
//    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        sv(collectionView)
        collectionView.fillContainer()
        collectionView.addSubview(refreshControl)
        collectionView.addSubview(spinner)
        collectionView.register(ToDosTabViewCell.self, forCellWithReuseIdentifier: "ToDosTabViewCell")
        collectionView.register(ToDosTabViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "ToDosTabViewHeader")
    }
}
