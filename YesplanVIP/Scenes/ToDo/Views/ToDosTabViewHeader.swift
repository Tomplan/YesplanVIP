//
//  ToDosTabViewHeader.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

class ToDosTabViewHeader: UICollectionReusableView {
    
    var ToDosViewHeaderLabel: UILabel
        = {
            var label = UILabel()
            label.textColor = UIColor.black
            label.textAlignment = .center
            //        label.font = UIFont(name: "Montserrat", size: 30)
            return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ToDosViewHeaderLabel)
        
        ToDosViewHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        ToDosViewHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5).isActive = true
        ToDosViewHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5).isActive = true
        ToDosViewHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ToDosViewHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
