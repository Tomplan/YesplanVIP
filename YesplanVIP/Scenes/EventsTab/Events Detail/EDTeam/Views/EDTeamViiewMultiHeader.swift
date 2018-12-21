//
//  EDTeamViiewMultiHeader.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 21/12/2018.
//  Copyright © 2018 Yesplan. All rights reserved.
//


import Foundation

import UIKit

class EDTeamViewMultiHeader: UICollectionReusableView {
    
    // MARK: Properties
    
    var EDTeamViewMultiHeaderLabel: UILabel
        = {
            var label = UILabel()
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.backgroundColor = UIColor(r: 90, g: 90, b: 90)
            label.font = UIFont(name: "Helvetica, sans-serif", size: 30)
            return label
    }()
    
    // MARK: Initialize Cell
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(EDTeamViewMultiHeaderLabel)
        
        EDTeamViewMultiHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        EDTeamViewMultiHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5).isActive = true
        EDTeamViewMultiHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5).isActive = true
        EDTeamViewMultiHeaderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        EDTeamViewMultiHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
