//
//  EventsTabViewHeader.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

class EventsTabViewHeader: UICollectionReusableView {
    
    var EventsViewHeaderLabel: UILabel
        = {
            var label = UILabel()
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.backgroundColor = UIColor(r: 90, g: 90, b: 90)
            label.font = UIFont(name: "Helvetica, sans-serif", size: 30)
            return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(EventsViewHeaderLabel)
        
        EventsViewHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        EventsViewHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5).isActive = true
        EventsViewHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5).isActive = true
        EventsViewHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        EventsViewHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
