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
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(EventsTabViewCell.self, forCellWithReuseIdentifier: "EventsTabViewCell")
//        collectionView.backgroundColor = .yellow
        return collectionView
    }()
    
    convenience init() {
    self.init(frame: CGRect.zero)

        sv(collectionView)
        collectionView.fillContainer()
        
        collectionView.addSubview(refreshControl)
        collectionView.addSubview(spinner)
        
        collectionView.register(EventsTabViewCell.self, forCellWithReuseIdentifier: "EventsTabViewCell") // Use PhotoCell

    }
}
  
