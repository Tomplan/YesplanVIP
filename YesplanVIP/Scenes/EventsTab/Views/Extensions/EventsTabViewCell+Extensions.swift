//
//  EventsTabViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 5/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Kingfisher

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension EventsTabViewCell {
    
    func populate(with event: Event) {
//        if let startdate = event.startdate {
//            LblEventHeaderName.text = startdate }
        if let name = event.name {
            LblEventName.text = name }
        if let defaultschedulestarttime = event.defaultschedulestarttime {
            LblEventsDefaultschedulestarttime.text = defaultschedulestarttime}
        if let locations = event.locations {
            if locations.count != 0 {
        if let location = locations[0].name {
            LblEventLocation.text = location } } }
        
        if let groupName = event.group!.name {
            LblEventGroupName.text = groupName }
//        title.text = p.title
//        photo.kf.setImage(with: p.imageUrl)
    }
}
