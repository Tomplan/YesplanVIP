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
        let name = resourcebooking.scheduleType
        lblName.text = name
        let start = resourcebooking.start
        let end = resourcebooking.end
        if let eventName = resourcebooking.eventName {
            lblName.text = "\(eventName)"
                lblName.textColor = UIColor.blue

            lblStart.text = "• \(start) - \(end)"
//            lblEventName.text = "     \(eventName)"

        } else {
//        let role = resourcebooking.role
            lblName.text = "\(resourcebooking.scheduleType)"
                lblName.textColor = UIColor.red
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
