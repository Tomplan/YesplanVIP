//
//  TDInfoViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

class TDInfoViewCell: UICollectionViewCell {
    
    // MARK: Properties
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    var lblStatus = UILabel()
    var lblName = UILabel()
    var lblPartOf = UILabel()
    var lblEvent = UILabel()
    var lblDescription = UILabel()
    var lblCost = UILabel()
    var lblDueDate = UILabel()
    var lblStartDate = UILabel()
    var lblDuration = UILabel()
    var lblTeam = UILabel()
    var lblAssignedTo = UILabel()
    var lblAssignedBy = UILabel()
    var lblYesplanID = UILabel()


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
        
        lblStatus.text = nil
        lblName.text = nil
        lblPartOf.text = nil
//        lblEvent.text = nil
        lblDescription.text = nil
        lblCost.text = nil
        lblDueDate.text = nil
        lblStartDate.text = nil
        lblDuration.text = nil
        lblTeam.text = nil
        lblAssignedTo.text = nil
        lblAssignedBy.text = nil
        lblYesplanID.text = nil
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
            lblStatus
            ,lblName
            ,lblPartOf
//            ,lblEvent
            ,lblDescription
            ,lblCost
            ,lblDueDate
            ,lblStartDate
            ,lblDuration
            ,lblTeam
            ,lblAssignedTo
            ,lblAssignedBy
            ,lblYesplanID
        )
        
        lblStatus.numberOfLines = 0
        lblStatus.font = UIFont.systemFont(ofSize: 15.0)
        lblStatus.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblName.numberOfLines = 0
        lblName.font = UIFont.systemFont(ofSize: 15.0)
        lblName.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblPartOf.numberOfLines = 0
        lblPartOf.font = UIFont.systemFont(ofSize: 15.0)
        lblPartOf.textColor = UIColor(r: 64, g: 64, b: 64)
        
//        lblEvent.numberOfLines = 0
//        lblEvent.font = UIFont.systemFont(ofSize: 15.0)
//        lblEvent.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblDescription.numberOfLines = 0
        lblDescription.font = UIFont.systemFont(ofSize: 15.0)
        lblDescription.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblCost.numberOfLines = 0
        lblCost.font = UIFont.systemFont(ofSize: 15.0)
        lblCost.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblDueDate.numberOfLines = 0
        lblDueDate.font = UIFont.systemFont(ofSize: 15.0)
        lblDueDate.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblStartDate.numberOfLines = 0
        lblStartDate.font = UIFont.systemFont(ofSize: 15.0)
        lblStartDate.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblDuration.numberOfLines = 0
        lblDuration.font = UIFont.systemFont(ofSize: 15.0)
        lblDuration.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblTeam.numberOfLines = 0
        lblTeam.font = UIFont.systemFont(ofSize: 15.0)
        lblTeam.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblAssignedTo.numberOfLines = 0
        lblAssignedTo.font = UIFont.systemFont(ofSize: 15.0)
        lblAssignedTo.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblAssignedBy.numberOfLines = 0
        lblAssignedBy.font = UIFont.systemFont(ofSize: 15.0)
        lblAssignedBy.textColor = UIColor(r: 64, g: 64, b: 64)
        
        lblYesplanID.numberOfLines = 0
        lblYesplanID.font = UIFont.systemFont(ofSize: 15.0)
        lblYesplanID.textColor = UIColor(r: 64, g: 64, b: 64)
    }
    
    private func setupConstraints() {
        
        layout(
            4
            ,|-16-lblStatus-16-|
            ,2
            ,|-16-lblName-16-|
            ,2
            ,|-16-lblPartOf-16-|
            ,2
//            ,|-16-lblEvent-16-|
//            ,0
            ,|-16-lblDescription-16-|
            ,2
            ,|-16-lblCost-16-|
            ,2
            ,|-16-lblDueDate-16-|
            ,2
            ,|-16-lblStartDate-16-|
            ,2
            ,|-16-lblDuration-16-|
            ,2
            ,|-16-lblTeam-16-|
            ,2
            ,|-16-lblAssignedTo-16-|
            ,2
            ,|-16-lblAssignedBy-16-|
            ,2
            ,|-16-lblYesplanID-16-|
            ,4
        )
    }
}
