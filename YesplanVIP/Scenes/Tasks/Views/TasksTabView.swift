//
//  TasksTabView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 25/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

// Get the full documentation at https://github.com/freshOS/Stevia

class TasksTabView: UIView {
    
    // MARK:- Properties:
    let refreshControl = UIRefreshControl()
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let cellHeight: CGFloat = 80
        let size: CGSize = CGSize(width: screenWidth, height: cellHeight)
        
        flowLayout.itemSize = size
        
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 40)
//        collectionView.backgroundColor = .red
        print("collectionViewTasks: ", collectionView)
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
        
        print("collectionviewTasks init")
//        collectionView.backgroundColor = .yellow
        sv(collectionView)
        collectionView.fillContainer()
        //
        collectionView.addSubview(refreshControl)
        collectionView.addSubview(spinner)
//        collectionView.backgroundColor = .red
        collectionView.register(TasksTabViewCell.self, forCellWithReuseIdentifier: "TasksTabViewCell")
        collectionView.register(TasksTabViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "TasksTabViewHeader")
    }
    
}
