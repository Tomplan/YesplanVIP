//
//  TasksTabViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 26/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia


class TasksTabViewCell: UICollectionViewCell {
    
    // MARK: Properties
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    var lblName = UILabel()
    var lblDeadline = UILabel()
    var lblStart = UILabel()
    var lblAssignedTo = UILabel()
    
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
        lblDeadline.text = "deadline: "
        lblStart.text = "start: "
        lblAssignedTo.text = nil
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
            lblName
            ,lblDeadline
            ,lblStart
            ,lblAssignedTo
        )
        
        lblName.numberOfLines = 0
        lblName.font = UIFont.systemFont(ofSize: 15.0)
//        lblName.textColor = UIColor.red
        
        lblDeadline.numberOfLines = 0
        lblDeadline.font = UIFont.systemFont(ofSize: 12.0)
        lblDeadline.textColor = UIColor(r: 64, g: 64, b: 64)

        lblStart.numberOfLines = 0
        lblStart.font = UIFont.systemFont(ofSize: 12.0)
        lblStart.textColor = UIColor(r: 64, g: 64, b: 64)

        lblAssignedTo.numberOfLines = 0
        lblAssignedTo.font = UIFont.systemFont(ofSize: 12.0)
        lblAssignedTo.textColor = UIColor(r: 158, g: 103, b: 0)
        
    }
    
    private func setupConstraints() {

        layout(
            5
            ,|-16-lblName-16-|
            ,0
            ,|-16-lblDeadline-16-|
            ,0
            ,|-16-lblStart-16-|
            ,0
            ,|-16-lblAssignedTo-16-|
            ,5
        )
    }
}
