//
//  EDSchedulesViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension EDSchedulesViewCell {
    
    func populate(with eventSchedule: EventSchedule, scheduleEntry: ScheduleEntry ) {
//        print(eventSchedule.defaultstartidx as Any)
//        print(eventSchedule.defaultstopidx as Any)
//        print(eventSchedule.entries)
//        print(eventSchedule.event)
        
        
        
        lblStarttime.text = scheduleEntry.starttime.convertDateString(dateFormat: "HH:mm")
        if let description = scheduleEntry.description {
            lblDescription.text = "   \(description)"
        }
        
        
    }
}
