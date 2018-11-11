//
//  TeamplannerTabViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension TeamplannerTabViewCell {
    
    func populate(with resourcebooking: TeamplannerTab.Something.ViewModel.Displ) {
        lblName.textColor = UIColor(r: 64, g: 64, b: 64)
        lblStart.textColor = UIColor(r: 64, g: 64, b: 64)
        
        
        let name = resourcebooking.scheduleType
        lblName.text = name
        let start = resourcebooking.start
        let end = resourcebooking.end
        if let eventName = resourcebooking.eventName {
            lblName.text = "\(eventName)"
            lblStart.text = "• \(start) - \(end)"
//            lblEventName.text = "     \(eventName)"

        } else {
            if resourcebooking.scheduleType == "shift" {
                lblName.textColor = UIColor(r: 158, g: 103, b: 0)
            }
            if resourcebooking.scheduleType == "break" {
                lblName.textColor = UIColor(r: 158, g: 103, b: 0)
            }
            if resourcebooking.scheduleType == "unavailability" {
                lblName.textColor = UIColor(r: 238, g: 0, b: 0)
            }
            
//        let role = resourcebooking.role
            lblName.text = "\(resourcebooking.scheduleType)"
            lblStart.text = "• \(start) - \(end)"
        }
//        if let defaultschedulestarttime = event.defaultschedulestarttime {
//            lblDefaultschedulestarttime.text = defaultschedulestarttime}
//        if let locations = event.locations {
//            if locations.count != 0 {
//                if let location = locations[0].name {
//                    lblLocation.text = location } } }
//        if let groupName = event.group!.name {
//            lblGroupName.text = groupName }
    }
}
