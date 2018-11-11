//
//  EventsDetailViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension EventsDetailViewCell {
    
    func populate(with event: String) {
         let name = event
        lblName.text = name
    }
}
