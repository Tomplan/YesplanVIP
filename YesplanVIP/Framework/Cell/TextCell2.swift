//
//  TextCell.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit
import Stevia

class TextCell2: CollectionViewCell {
    
    var textLabel = UILabel()
    
    lazy var width: NSLayoutConstraint = {
           let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
           width.isActive = true
           return width
       }()
    
    // MARK: Initialize Cell

        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.translatesAutoresizingMaskIntoConstraints = false
            setupComponents()
            setupConstraints()
        }

        required init?(coder aDecoder: NSCoder)
        {
            fatalError("init(coder:) has not been implemented")
        }

        override func awakeFromNib() {
            super.awakeFromNib()

            fatalError("Interface Builder is not supported!")
        }

        override func reset() {
            super.reset()
            
            textLabel.text = nil
            
        }

        // Mark: Auto-sizing Cell

        override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
            width.constant = bounds.size.width
            return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 20))
        }

        // MARK: Private methods

        private func setupComponents() {

            layer.masksToBounds = true
    //        layer.cornerRadius = 5
            layer.borderWidth = 1
    //        layer.shadowOffset = CGSize(width: -2, height: 2)
            //        layer.borderColor = UIColor(r: 144, g: 144, b: 144).cgColor
                    layer.borderColor = UIColor.black.cgColor
            //        backgroundColor = UIColor(r: 158, g: 158, b: 158)
//                    backgroundColor = UIColor.green
            sv(
                textLabel
            )

            textLabel.numberOfLines = 0
            textLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
            textLabel.textColor = UIColor.lightGray
        }

        private func setupConstraints() {
            layout(
                2
                ,|-16-textLabel-16-|
                ,2
            )
        }
    }
