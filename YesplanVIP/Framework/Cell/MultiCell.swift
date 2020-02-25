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
//    let spinner = UIActivityIndicatorView(style: .gray)
    
    lazy var collectionView : UICollectionView = {

        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width

        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 1 // vertical space
        flowLayout.minimumInteritemSpacing = 0 // horizontal space
        flowLayout.headerReferenceSize = CGSize(width: screenWidth, height: 35)
        flowLayout.sectionInset = UIEdgeInsets(top: 1.0, left: 0.0, bottom: 1.0, right: 0.0)
        // cell size:
        flowLayout.estimatedItemSize = CGSize(width: screenWidth, height: 1)
        collectionView.backgroundColor = UIColor.black
        return collectionView
    }()
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
//
//    lazy var height: NSLayoutConstraint = {
//        let height = contentView.heightAnchor.constraint(equalToConstant: bounds.size.height)
//        height.isActive = true
//        print("height:", height)
//        return height
//    }()
    
    open var source: CollectionViewSource? = nil {
        didSet {
            self.source?.register(itemsFor: self.collectionView)
            self.collectionView.dataSource = self.source
            self.collectionView.delegate = self.source
        }
    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.collectionView.showsHorizontalScrollIndicator = false
//    }
    
    override func reset() {
        super.reset()
        
        self.source = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupComponents()
        setupConstraints()

    }
    
    
    func setupComponents(){
        
//        contentView.backgroundColor = UIColor.red
//        collectionView.backgroundColor = UIColor.yellow

        
        sv(collectionView)
//
//        collectionView.fillContainer()
        
//        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        collectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        collectionView.widthAnchor.constraint(equalToConstant: self.width.constant).isActive = true
////
        setupConstraints()
//        contentView.addSubview(collectionView)
//        print(contentView.subviews.last)
        
//        if let lastSubview = contentView.subviews.last {
////            collectionView.frame
////            collectionView.autoPinEdge(.bottom, to: .bottom, of: lastSubview)
//
//            collectionView.frameLayoutGuide.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 20)
//            
////            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
//        }
//        collectionView.register(MultiHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "MultiHeaderCell")
//        collectionView.register(MultiCell.self, forCellWithReuseIdentifier: "MultiCell")

    }
    
    private func setupConstraints() {
        layout(
            // adjusting yellowView to redView
            4
            ,|-16-collectionView-16-|
            ,4
        )
        
    }
    // Mark: Auto-sizing Cell
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        width.constant = bounds.size.width
//        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 200))
//    }

    //forces the system to do one layout pass
//    var isHeightCalculated: Bool = false
//
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        //Exhibit A - We need to cache our calculation to prevent a crash.
//        if !isHeightCalculated {
//            setNeedsLayout()
//            layoutIfNeeded()
//            let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//            var newFrame = layoutAttributes.frame
//            newFrame.size.width = CGFloat(ceilf(Float(size.width)))
//            layoutAttributes.frame = newFrame
//            isHeightCalculated = true
//        }
//        return layoutAttributes
//    }
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        let autoLayoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
//
//        // Specify you want _full width_
//        let targetSize = CGSize(width: layoutAttributes.frame.width, height: layoutAttributes.frame.height)
//
//        // Calculate the size (height) using Auto Layout
//        let autoLayoutSize = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.defaultLow)
//        print(autoLayoutSize)
//        let autoLayoutFrame = CGRect(origin: autoLayoutAttributes.frame.origin, size: autoLayoutSize)
//
//        // Assign the new size to the layout attributes
//        autoLayoutAttributes.frame = autoLayoutFrame
//        return autoLayoutAttributes
//    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        width.constant = bounds.size.width
////        height.constant = self.collectionView.collectionViewLayout.collectionViewContentSize.height
//        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 200))
//        // contentView.intrinsicContentSize.height)
//    } // NOT: UIView.layoutFittingCompressedSize.height
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.size.width
//        let sizingCell = MultiCell()
//        sizingCell.contentView.bounds.size.width = width
//
//        // 6.
////        configure(cell: sizingCell)
//
//        // 7.
//        sizingCell.contentView.setNeedsLayout()
//        sizingCell.contentView.layoutIfNeeded()
//
//        // 8.
//        let height = sizingCell.contentView.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)).height
//
//        // 9.
//        sizingCell.prepareForReuse()
//
//        return CGSize(width: width, height: 100)
//
//    }
//
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
