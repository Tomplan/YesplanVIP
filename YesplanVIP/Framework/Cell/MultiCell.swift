//
//  EDTeamViewMultiCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 14/12/2018.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

import UIKit
import Stevia


class MultiCell: CollectionViewCell, UICollectionViewDelegateFlowLayout {
   
    let refreshControl = UIRefreshControl()
    let spinner = UIActivityIndicatorView(style: .gray)
    
    lazy var collectionView : UICollectionView = {

        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width

        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 2
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 35)
        flowLayout.sectionInset = UIEdgeInsets(top: 4.0, left: 0.0, bottom: 4.0, right: 0.0)
        flowLayout.estimatedItemSize = CGSize(width: screenWidth, height: 100)

        collectionView.backgroundColor = UIColor.green // UIColor(r: 176, g: 176, b: 176)

        //        let cellHeight: CGFloat = 75
        //        let size: CGSize = CGSize(width: screenWidth, height: cellHeight)
        //        flowLayout.itemSize = CGSize(width: collectionView.frame.size.width, height: 100)
        //        flowLayout.itemSize = size

        return collectionView
    }()
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        print("width:", width)
        return width
    }()
    
    open var source: CollectionViewSource? = nil {
        didSet {
            self.source?.register(itemsFor: self.collectionView)
            
            self.collectionView.dataSource = self.source
            self.collectionView.delegate = self.source
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    override func reset() {
        super.reset()
        
        self.source = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupViews()
    }
    
    
    func setupViews(){
        
        sv(collectionView)
        collectionView.fillContainer()
        collectionView.addSubview(refreshControl)
        collectionView.addSubview(spinner)
        collectionView.register(EDTeamViewMultiHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "EDTeamViewMultiHeader")
        collectionView.register(MultiCell.self, forCellWithReuseIdentifier: "MultiCell")

    }
    
    // Mark: Auto-sizing Cell
   
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1000))
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.frame.width, height: self.frame.height - 10);
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
