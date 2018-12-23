//
//  CollectionViewController.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 11..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

//    @IBOutlet open weak var collectionView: UICollectionView!
    lazy var collectionView : UICollectionView = {

        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width

        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 2
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 35)
        flowLayout.sectionInset = UIEdgeInsets(top: 4.0, left: 0.0, bottom: 4.0, right: 0.0)
        flowLayout.estimatedItemSize = CGSize(width: screenWidth, height: 1)

        collectionView.backgroundColor = UIColor.brown // UIColor(r: 176, g: 176, b: 176)

        //        let cellHeight: CGFloat = 75
        //        let size: CGSize = CGSize(width: screenWidth, height: cellHeight)
        //        flowLayout.itemSize = CGSize(width: collectionView.frame.size.width, height: 100)
        //        flowLayout.itemSize = size

        return collectionView
    }()
    
    open var source: CollectionViewSource? = nil {
        didSet {
            self.source?.register(itemsFor: self.collectionView)

            self.collectionView.dataSource = self.source
            self.collectionView.delegate = self.source
        }
    }

    open override func loadView() {
        super.loadView()
        
//        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        self.collectionView = collectionView
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
//        self.collectionView.backgroundColor = .clear
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.showsVerticalScrollIndicator = true
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
//        if self.isViewLoaded && self.view.window == nil {
//            self.collectionView = nil
//        }
    }
    
    // MARK: - handle autorotation
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard
            let previousTraitCollection = previousTraitCollection,
            self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass ||
            self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass
        else {
            return
        }
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.reloadData()
    }
    
    open override func viewWillTransition(to size: CGSize,
                                          with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.bounds.size = size
        
        coordinator.animate(alongsideTransition: { context in
            context.viewController(forKey: UITransitionContextViewControllerKey.from)
            
        }, completion: { [weak self] _ in
            self?.collectionView.collectionViewLayout.invalidateLayout()
        })
    }
}

