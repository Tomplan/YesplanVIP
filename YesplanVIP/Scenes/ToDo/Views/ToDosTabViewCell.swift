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
        //    { super.init(coder: aDecoder)}
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.lblName.text = nil
        self.lblDeadline.text = "deadline: "
        self.lblStart.text = "start: "
        self.lblAssignedTo.text = nil
        
        
        
    }
    // MARK: Private methods
    private func setupComponents() {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 4
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = UIColor(rgbString: "rgb(224,249,222)")
        
        sv(
            lblName
            ,lblDeadline
            ,lblStart
            ,lblAssignedTo
        )
        
        self.lblName.numberOfLines = 0
        self.lblName.font = UIFont.systemFont(ofSize: 15.0)
        self.lblName.textColor = UIColor.red
        
        self.lblDeadline.numberOfLines = 0
        self.lblDeadline.font = UIFont.systemFont(ofSize: 12.0)
        self.lblDeadline.textColor = UIColor.black
        
        self.lblStart.numberOfLines = 0
        self.lblStart.font = UIFont.systemFont(ofSize: 12.0)
        self.lblStart.textColor = UIColor.black
        
        self.lblAssignedTo.numberOfLines = 0
        self.lblAssignedTo.font = UIFont.systemFont(ofSize: 12.0)
        self.lblAssignedTo.textColor = UIColor.orange
        
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
