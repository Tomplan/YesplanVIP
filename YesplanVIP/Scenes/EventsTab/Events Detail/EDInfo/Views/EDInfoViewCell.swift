//
//  EDInfoViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

class EDInfoViewCell: UICollectionViewCell {
    
    // MARK: Properties
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    var lblName = UILabel()
    var lblGroup = UILabel()
    var lblDefaultschedulestart = UILabel()
    var lblDefaultscheduleend = UILabel()
    var lblProfileName = UILabel()
    var lblStatusName = UILabel()

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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        lblName.text = nil
        lblGroup.text = nil
        lblDefaultschedulestart.text = nil
        lblDefaultscheduleend.text = nil
        lblProfileName.text = nil
        lblStatusName.text = nil
        
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    // MARK: Private methods
    private func setupComponents() {
        
        layer.masksToBounds = true
//        layer.cornerRadius = 5
//        layer.borderWidth = 4
//        layer.shadowOffset = CGSize(width: -2, height: 2)
//        layer.borderColor = UIColor(r: 144, g: 144, b: 144).cgColor
//        backgroundColor = UIColor(r: 158, g: 158, b: 158)
        
        sv(
            lblName
            ,lblGroup
            ,lblDefaultschedulestart
            ,lblDefaultscheduleend
            ,lblProfileName
            ,lblStatusName
        )
        
        lblName.numberOfLines = 0
        lblName.font = UIFont.systemFont(ofSize: 15.0)
        lblName.textColor = UIColor.lightGray
        
        lblGroup.numberOfLines = 0
        lblGroup.font = UIFont.systemFont(ofSize: 15.0)
        lblGroup.textColor = UIColor.lightGray
        
        lblDefaultschedulestart.numberOfLines = 0
        lblDefaultschedulestart.font = UIFont.systemFont(ofSize: 15.0)
        lblDefaultschedulestart.textColor = UIColor.lightGray
        
        lblDefaultscheduleend.numberOfLines = 0
        lblDefaultscheduleend.font = UIFont.systemFont(ofSize: 15.0)
        lblDefaultscheduleend.textColor = UIColor.lightGray
        
        lblProfileName.numberOfLines = 0
        lblProfileName.font = UIFont.systemFont(ofSize: 15.0)
        lblProfileName.textColor = UIColor.lightGray
        
        lblStatusName.numberOfLines = 0
        lblStatusName.font = UIFont.systemFont(ofSize: 15.0)
        lblStatusName.textColor = UIColor.lightGray
    }
    
    private func setupConstraints() {
        
        layout(
            4
            ,|-16-lblName-16-|
            ,0
            ,|-16-lblGroup-16-|
            ,0
            ,|-16-lblDefaultschedulestart-16-|
            ,0
            ,|-16-lblDefaultscheduleend-16-|
            ,0
            ,|-16-lblProfileName-16-|
            ,0
            ,|-16-lblStatusName-16-|
            ,4
        )
    }
}
