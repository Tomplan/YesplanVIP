//
//  EventsTabViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

class EventsTabViewCell: UICollectionViewCell {
    
    // MARK: Properties
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    var lblHeaderName = UILabel()
    var lblName = UILabel()
    var lblDefaultschedulestarttime = UILabel()
    var lblLocation = UILabel()
    var lblGroupName = UILabel()
    
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
        lblDefaultschedulestarttime.text = nil
        lblLocation.text = nil
        lblGroupName.text = nil
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
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
            lblHeaderName,
            lblName,
            lblDefaultschedulestarttime,
            lblLocation,
            lblGroupName
        )
        
        lblName.numberOfLines = 0
        lblName.font = UIFont.systemFont(ofSize: 15.0)
        lblName.textColor = UIColor.red
        
        lblDefaultschedulestarttime.numberOfLines = 0
        lblDefaultschedulestarttime.font = UIFont.systemFont(ofSize: 12.0)
        lblDefaultschedulestarttime.textColor = UIColor.gray
        
        lblLocation.numberOfLines = 0
        lblLocation.font = UIFont.systemFont(ofSize: 12.0)
        lblLocation.textColor = UIColor.lightGray
        
        lblGroupName.numberOfLines = 0
        lblGroupName.font = UIFont.systemFont(ofSize: 12.0)
        lblGroupName.textColor = UIColor.lightGray
        
    }
    
    private func setupConstraints() {

        layout(
            4,
            |-16-lblName-16-|,
            0,
            |-16-lblDefaultschedulestarttime-16-|,
            0,
            |-16-lblLocation-16-|,
            0,
            |-16-lblGroupName-16-|
            ,4
        )
    }
}
