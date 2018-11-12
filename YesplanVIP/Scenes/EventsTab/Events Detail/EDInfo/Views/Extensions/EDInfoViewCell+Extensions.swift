//
//  EDInfoViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension EDInfoViewCell {
    
    func populate(with event: Event) {
        
        if let name = event.name {
            lblName.text = name
        }
        
        if let groupName = event.group?.name {
                lblGroup.text = groupName
        }
        
        if let defaultschedulestart = event.defaultschedulestart {
            lblDefaultschedulestart.text = defaultschedulestart.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm")
        }
        
        if let defaultscheduleend = event.defaultscheduleend {
            lblDefaultscheduleend.text = defaultscheduleend.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm")
        }
        
        if let profileName = event.profile?.name {
            lblProfileName.text = profileName
        }
        
        if let statusName = event.status?.name {
            lblStatusName.text = statusName
        }
    }
}
