//
//  TeamplannerTabView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

// Get the full documentation at https://github.com/freshOS/Stevia

class TeamplannerTabView: UIView {
    
//    var TeamplannerPrefsAction: (() -> Void)?

    // MARK:- Properties:
    let refreshControl = UIRefreshControl()
    let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
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
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor.black // UIColor(r: 176, g: 176, b: 176)
      
        return collectionView
    }()
    
//    let backgroundImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "yesplanNB 1024x1024")
//        return iv
//    }()
    
//    let TeamplannerPrefsButton: UIButton = {
//        let button = UIButton(title: "Login", borderColor: .greenBorderColor)
//        button.addTarget(self, action: #selector(handleTeamplannerPrefs), for: .touchUpInside)
//        return button
//    }()
//
//    @objc func handleTeamplannerPrefs() {
//        TeamplannerPrefsAction?()
//    }
    convenience init() {
        self.init(frame: CGRect.zero)
        
        sv(collectionView)
        collectionView.fillContainer()
        collectionView.addSubview(refreshControl)
        collectionView.addSubview(spinner)
        collectionView.register(TeamplannerTabViewCell.self, forCellWithReuseIdentifier: "TeamplannerTabViewCell")
        collectionView.register(TeamplannerTabViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "TeamplannerTabViewHeader")
    }
    
}
