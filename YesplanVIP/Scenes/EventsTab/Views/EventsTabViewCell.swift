//
//  EventsTabViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia

struct EventsViewCellConstants {
    
//    static let width: CGFloat = 1.12
//    static let height: CGFloat = 5.5
}

class EventsTabViewCell: UICollectionViewCell {
    
    // MARK: Properties
    var lblHeaderName = UILabel()
    var lblName = UILabel()
    var lblDefaultschedulestarttime = UILabel()
    var lblLocation = UILabel()
    var lblGroupName = UILabel()
    
    override init(frame: CGRect) {
        print("override init")

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
        print("prepareForReuse")
        self.lblName.text = nil
        self.lblDefaultschedulestarttime.text = nil
        self.lblLocation.text = nil
        self.lblGroupName.text = nil

        
        
    }
    // MARK: Private methods
    private func setupComponents() {
        print("setupComponents")

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
        
        self.lblName.translatesAutoresizingMaskIntoConstraints = false
        self.lblName.numberOfLines = 0
        self.lblName.font = UIFont.systemFont(ofSize: 15.0)
        self.lblName.textColor = UIColor.red
        self.contentView.addSubview(self.lblName)

        self.lblDefaultschedulestarttime.translatesAutoresizingMaskIntoConstraints = false
        self.lblDefaultschedulestarttime.numberOfLines = 0
        self.lblDefaultschedulestarttime.font = UIFont.systemFont(ofSize: 12.0)
        self.lblDefaultschedulestarttime.textColor = UIColor.gray
        self.contentView.addSubview(self.lblDefaultschedulestarttime)

        self.lblLocation.translatesAutoresizingMaskIntoConstraints = false
        self.lblLocation.numberOfLines = 0
        self.lblLocation.font = UIFont.systemFont(ofSize: 12.0)
        self.lblLocation.textColor = UIColor.lightGray
        self.contentView.addSubview(self.lblLocation)

        self.lblGroupName.translatesAutoresizingMaskIntoConstraints = false
        self.lblGroupName.numberOfLines = 0
        self.lblGroupName.font = UIFont.systemFont(ofSize: 12.0)
        self.lblGroupName.textColor = UIColor.lightGray
        self.contentView.addSubview(self.lblGroupName)

//        self.lblHeaderName.translatesAutoresizingMaskIntoConstraints = false
//        self.lblHeaderName.numberOfLines = 0
//        self.lblHeaderName.font = UIFont.systemFont(ofSize: 12.0)
//        self.lblHeaderName.textColor = UIColor.lightGray
//        self.contentView.addSubview(self.lblHeaderName)

        
        
//         self
//                contentView.layer.borderWidth = 2.0
//                contentView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    private func setupConstraints() {
        print("setupConstraints")

//        layout(
//            5,
//            |-16-lblHeaderName-16-|,
//            5,
//            |-16-lblName-16-|,
//            5,
//            |-16-lblsDefaultschedulestarttime-16-|,
//            5,
//            |-16-lblLocation-16-|,
//            5,
//            |-16-lblGroupName-16-|,
//            5
//        )
        
        self.lblName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0).isActive = true
        self.lblName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.lblName.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.lblName.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -4.0).isActive = true
        
        self.lblDefaultschedulestarttime.topAnchor.constraint(equalTo: self.lblName.bottomAnchor, constant: 0.0).isActive = true
        self.lblDefaultschedulestarttime.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.lblDefaultschedulestarttime.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.lblDefaultschedulestarttime.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -4.0).isActive = true
        
        self.lblLocation.topAnchor.constraint(equalTo: self.lblDefaultschedulestarttime.bottomAnchor, constant: 0.0).isActive = true
        self.lblLocation.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.lblLocation.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.lblLocation.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -2.0).isActive = true
        
        self.lblGroupName.topAnchor.constraint(equalTo: self.lblLocation.bottomAnchor, constant: 0.0).isActive = true
        self.lblGroupName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.lblGroupName.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.lblGroupName.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -2.0).isActive = true
    }
}
