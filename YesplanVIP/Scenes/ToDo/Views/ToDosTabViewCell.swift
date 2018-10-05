//
//  ToDosTabViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia


class ToDosTabViewCell: UICollectionViewCell {
    
    // MARK: Properties
    var lblName = UILabel()
    var lblDeadline = UILabel()
    var lblStart = UILabel()
    var lblAssignedTo = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    // MARK: Private methods
    private func setupComponents() {
        
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 4
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = UIColor(rgbString: "rgb(224,249,222)")
        
        sv(
            lblName
            ,lblDeadline
            ,lblStart
            ,lblAssignedTo
        )
        
        lblName.numberOfLines = 0
        lblName.font = UIFont.systemFont(ofSize: 15.0)
        lblName.textColor = UIColor.red
        
        lblDeadline.numberOfLines = 0
        lblDeadline.font = UIFont.systemFont(ofSize: 12.0)
        lblDeadline.textColor = UIColor.black
        
        lblStart.numberOfLines = 0
        lblStart.font = UIFont.systemFont(ofSize: 12.0)
        lblStart.textColor = UIColor.black
        
        lblAssignedTo.numberOfLines = 0
        lblAssignedTo.font = UIFont.systemFont(ofSize: 12.0)
        lblAssignedTo.textColor = UIColor.orange
    }
    
    private func setupConstraints() {
        
        layout(
            5
            ,|-16-lblName-16-|
            ,2
            ,|-16-lblDeadline-16-|
            ,2
            ,|-16-lblStart-16-|
            ,2
            ,|-16-lblAssignedTo-16-|
        )
    }
}
