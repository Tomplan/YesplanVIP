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
    var lblHeaderName = UILabel()
    var lblName = UILabel()
    var lblDefaultschedulestarttime = UILabel()
    var lblLocation = UILabel()
    var lblGroupName = UILabel()
    
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
        
        self.lblName.text = nil
        self.lblDefaultschedulestarttime.text = nil
        self.lblLocation.text = nil
        self.lblGroupName.text = nil

        
        
    }
    // MARK: Private methods
    private func setupComponents() {

        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 4
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = UIColor.yellow
        
        sv(
            lblHeaderName,
            lblName,
            lblDefaultschedulestarttime,
            lblLocation,
            lblGroupName
        )
        
        self.lblName.numberOfLines = 0
        self.lblName.font = UIFont.systemFont(ofSize: 15.0)
        self.lblName.textColor = UIColor.red
        
        self.lblDefaultschedulestarttime.numberOfLines = 0
        self.lblDefaultschedulestarttime.font = UIFont.systemFont(ofSize: 12.0)
        self.lblDefaultschedulestarttime.textColor = UIColor.gray
        
        self.lblLocation.numberOfLines = 0
        self.lblLocation.font = UIFont.systemFont(ofSize: 12.0)
        self.lblLocation.textColor = UIColor.lightGray
        
        self.lblGroupName.numberOfLines = 0
        self.lblGroupName.font = UIFont.systemFont(ofSize: 12.0)
        self.lblGroupName.textColor = UIColor.lightGray
        
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
            
        )
    }
}
