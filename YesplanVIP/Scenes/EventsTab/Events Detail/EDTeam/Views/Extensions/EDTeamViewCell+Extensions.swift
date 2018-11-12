//
//  EDTeamViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension EDTeamViewCell {
    
    func populate(with event: Event, location: Base ) {
        
        if let name = location.name {
            lblName.text = name
        }
        
        
    }
}
