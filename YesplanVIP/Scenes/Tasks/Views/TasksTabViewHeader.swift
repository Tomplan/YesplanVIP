//
//  TasksTabViewHeader.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 26/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

class TasksTabViewHeader: UICollectionReusableView {
    
    var TasksViewHeaderLabel: UILabel
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
        addSubview(TasksViewHeaderLabel)
        
        TasksViewHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        TasksViewHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5).isActive = true
        TasksViewHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5).isActive = true
        TasksViewHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        TasksViewHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
