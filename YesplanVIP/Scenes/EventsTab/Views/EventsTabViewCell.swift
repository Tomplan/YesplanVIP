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
    
    static let width: CGFloat = 1.12
    static let height: CGFloat = 5.5
}

class EventsTabViewCell: UICollectionViewCell {
    
    // MARK: Properties
    var LblEventHeaderName = UILabel()
    var LblEventName = UILabel()
    var LblEventsDefaultschedulestarttime = UILabel()
    var LblEventLocation = UILabel()
    var LblEventGroupName = UILabel()
    
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
        
        self.LblEventHeaderName.text = nil
        self.LblEventName.text = nil
        self.LblEventsDefaultschedulestarttime.text = nil
        self.LblEventLocation.text = nil
        self.LblEventGroupName.text = nil

        
        
    }
    // MARK: Private methods
    private func setupComponents() {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 4
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = UIColor.yellow
        
//        sv(
//            LblEventHeaderName,
//            LblEventName,
//            LblEventsDefaultschedulestarttime,
//            LblEventLocation,
//            LblEventGroupName
//        )
        
//        layout(
//            16,
//            |-16-LblEventHeaderName-16-|,
//            5,
//            |-16-LblEventName-16-|,
//            5,
//            |-16-LblEventsDefaultschedulestarttime-16-|,
//            5,
//            |-16-LblEventLocation-16-|,
//            5,
//            |-16-LblEventGroupName-16-|,
//            16
//        )
        
        self.LblEventName.translatesAutoresizingMaskIntoConstraints = false
        self.LblEventName.numberOfLines = 0
        self.LblEventName.font = UIFont.systemFont(ofSize: 15.0)
        self.LblEventName.textColor = UIColor.red
        self.contentView.addSubview(self.LblEventName)

        self.LblEventsDefaultschedulestarttime.translatesAutoresizingMaskIntoConstraints = false
        self.LblEventsDefaultschedulestarttime.numberOfLines = 0
        self.LblEventsDefaultschedulestarttime.font = UIFont.systemFont(ofSize: 12.0)
        self.LblEventsDefaultschedulestarttime.textColor = UIColor.gray
        self.contentView.addSubview(self.LblEventsDefaultschedulestarttime)

        self.LblEventLocation.translatesAutoresizingMaskIntoConstraints = false
        self.LblEventLocation.numberOfLines = 0
        self.LblEventLocation.font = UIFont.systemFont(ofSize: 12.0)
        self.LblEventLocation.textColor = UIColor.lightGray
        self.contentView.addSubview(self.LblEventLocation)

        self.LblEventGroupName.translatesAutoresizingMaskIntoConstraints = false
        self.LblEventGroupName.numberOfLines = 0
        self.LblEventGroupName.font = UIFont.systemFont(ofSize: 12.0)
        self.LblEventGroupName.textColor = UIColor.lightGray
        self.contentView.addSubview(self.LblEventGroupName)

        self.LblEventHeaderName.translatesAutoresizingMaskIntoConstraints = false
        self.LblEventHeaderName.numberOfLines = 0
        self.LblEventHeaderName.font = UIFont.systemFont(ofSize: 12.0)
        self.LblEventHeaderName.textColor = UIColor.lightGray
        self.contentView.addSubview(self.LblEventHeaderName)

        
        
//         self
//                contentView.layer.borderWidth = 2.0
//                contentView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    private func setupConstraints() {
        
        self.LblEventName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0).isActive = true
        self.LblEventName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.LblEventName.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.LblEventName.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -4.0).isActive = true
        
        self.LblEventsDefaultschedulestarttime.topAnchor.constraint(equalTo: self.LblEventName.bottomAnchor, constant: 0.0).isActive = true
        self.LblEventsDefaultschedulestarttime.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.LblEventsDefaultschedulestarttime.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.LblEventsDefaultschedulestarttime.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -4.0).isActive = true
        
        self.LblEventLocation.topAnchor.constraint(equalTo: self.LblEventsDefaultschedulestarttime.bottomAnchor, constant: 0.0).isActive = true
        self.LblEventLocation.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.LblEventLocation.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.LblEventLocation.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -2.0).isActive = true
        
        self.LblEventGroupName.topAnchor.constraint(equalTo: self.LblEventLocation.bottomAnchor, constant: 0.0).isActive = true
        self.LblEventGroupName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.LblEventGroupName.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.LblEventGroupName.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -2.0).isActive = true
    }
}
