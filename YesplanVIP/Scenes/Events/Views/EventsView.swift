//
//  EventsView.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 15/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

class EventsView: UIView {
    
    // MARK:- Properties:
    var eventsCollectionView: UICollectionView
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray) // UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    // MARK:- Initializers:
    init() {
        
        // eventsCollectionView
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        eventsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(frame: CGRect.zero)
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Setup components
    private func setupComponents() {
        // self
        backgroundColor = UIColor.black
        
        // spinner
        addSubview(spinner)
        
        // eventsCollectionView
        eventsCollectionView.backgroundColor = UIColor.clear
        eventsCollectionView.showsVerticalScrollIndicator = false
        eventsCollectionView.showsHorizontalScrollIndicator = false
        eventsCollectionView.bounces = true
        eventsCollectionView.decelerationRate = UIScrollViewDecelerationRateNormal
        addSubview(eventsCollectionView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            // spinner
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // eventsCollectionView
            eventsCollectionView.topAnchor.constraint(equalTo: topAnchor),
            eventsCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            eventsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            eventsCollectionView.rightAnchor.constraint(equalTo: rightAnchor)
            ])
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        eventsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}
