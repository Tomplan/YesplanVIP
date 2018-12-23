//
//  EventsTabViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 5/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension EventsTabViewCell {
    
    func populate(with event: Event) {
        if let name = event.name {
            lblName.text = name }
        if let defaultschedulestarttime = event.defaultschedulestarttime {
            lblDefaultschedulestarttime.text = defaultschedulestarttime}
        if let locations = event.locations {
            if locations.count != 0 {
        if let location = locations[0].name {
            lblLocation.text = location } } }
        if let group = event.group {
            if let groupName = group.name {
                lblGroupName.text = groupName }
            }
    }
}
