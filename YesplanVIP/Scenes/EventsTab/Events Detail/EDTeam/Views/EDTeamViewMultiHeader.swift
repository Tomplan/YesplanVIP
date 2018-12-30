////
////  EDTeamViiewMultiHeader.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 21/12/2018.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
//
//import Foundation
//
//import UIKit
//import Stevia
//
//class EDTeamViewMultiHeader: CollectionViewCell { // UICollectionReusableView
//    
//    // MARK: Properties
//    
////    var EDTeamViewMultiHeaderLabel: UILabel
////        = {
////            var label = UILabel()
////            label.textColor = UIColor.white
////            label.textAlignment = .center
////            label.backgroundColor = UIColor(r: 90, g: 90, b: 90)
////            label.font = UIFont(name: "Helvetica, sans-serif", size: 30)
////            return label
////    }()
//    var EDTeamViewMultiHeaderLabel = UILabel()
//    
//    lazy var width: NSLayoutConstraint = {
//        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
//        width.isActive = true
//        return width
//    }()
//    // MARK: Initialize Cell
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        addSubview(EDTeamViewMultiHeaderLabel)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        setupComponents()
//        setupConstraints()
////        EDTeamViewMultiHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
////        EDTeamViewMultiHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5).isActive = true
////        EDTeamViewMultiHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5).isActive = true
////        EDTeamViewMultiHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
////        EDTeamViewMultiHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        fatalError("Interface Builder is not supported!")
//    }
//    
//    override func reset() {
//        super.reset()
//        
//        EDTeamViewMultiHeaderLabel.text = nil
//        
//    }
//    
//    // Mark: Auto-sizing Cell
//    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        width.constant = bounds.size.width
//        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
//    }
//
//    
//    // MARK: Private methods
//    
//    private func setupComponents() {
//        
//        layer.masksToBounds = true
//        layer.cornerRadius = 5
//        layer.borderWidth = 4
//        layer.shadowOffset = CGSize(width: -2, height: 2)
//        layer.borderColor = UIColor(r: 144, g: 144, b: 144).cgColor
//        backgroundColor = UIColor(r: 158, g: 158, b: 158)
//        
//        sv(
//            EDTeamViewMultiHeaderLabel
//        )
//        
//        EDTeamViewMultiHeaderLabel.numberOfLines = 0
//        EDTeamViewMultiHeaderLabel.font = UIFont.systemFont(ofSize: 15.0)
//        EDTeamViewMultiHeaderLabel.textColor = UIColor(r: 64, g: 64, b: 64)
//    }
//    
//    private func setupConstraints() {
//        layout(
//            4
//            ,|-16-EDTeamViewMultiHeaderLabel-16-|
//            ,4
//            
//        )
//    }
//    
//}
