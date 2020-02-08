//
//  TDInfoViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension TDInfoViewCell {
    
    func populate(with task: Task) {
        
        if let name = task.name {
            lblName.text = name
        }
        
//        if let groupName = task.group?.name {
//                lblGroup.text = groupName
//        }
        
//        if let defaultschedulestart = task.defaultschedulestart {
//            lblDefaultschedulestart.text = defaultschedulestart.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm")
//        }
//
//        if let defaultscheduleend = task.defaultscheduleend {
//            lblDefaultscheduleend.text = defaultscheduleend.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm")
//        }
        
//        if let profileName = task.profile?.name {
//            lblProfileName.text = profileName
//        }
//        
//        if let statusName = task.status?.name {
//            lblStatusName.text = statusName
//        }
    }
}
