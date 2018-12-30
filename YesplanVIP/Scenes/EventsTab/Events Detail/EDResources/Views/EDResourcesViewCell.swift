//
//  EDResourcesViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

class EDResourcesViewCell: CollectionViewCell {
    
    // MARK: Properties
    
    var lblName = UILabel()
    var lblTime = UILabel()
    var lblRole = UILabel()
    
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
        
        lblName.text = nil
        lblTime.text = nil
        lblRole.text = nil
        
    }
    
    // Mark: Auto-sizing Cell
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 20))
    }
    
    // MARK: Private methods
    
    private func setupComponents() {
        
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 4
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.borderColor = UIColor(r: 144, g: 144, b: 144).cgColor
        backgroundColor = UIColor(r: 158, g: 158, b: 158)
        
        sv(
            lblName
            ,lblTime
            ,lblRole
        )
        
        lblName.numberOfLines = 0
        lblName.font = UIFont.systemFont(ofSize: 15.0)
        lblName.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblTime.numberOfLines = 0
        lblTime.font = UIFont.systemFont(ofSize: 12.0)
        lblTime.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblRole.numberOfLines = 0
        lblRole.font = UIFont.systemFont(ofSize: 12.0)
        lblRole.textColor = UIColor(r: 64, g: 64, b: 64)
    }
    
    private func setupConstraints() {
        layout(
            4
            ,|-16-lblName-16-|
            ,0
            ,|-16-lblTime-16-|
            ,0
            ,|-16-lblRole-16-|
            ,4
        )
    }
}