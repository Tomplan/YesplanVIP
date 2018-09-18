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
    
    func populate(with p: Event) {
        LblEventHeaderName.text = p.name
//         LblEventName.text = UILabel()
//         LblEventsDefaultschedulestarttime = UILabel()
//         LblEventLocation = UILabel()
//         LblEventGroupName = UILabel()
//        title.text = p.title
//        photo.kf.setImage(with: p.imageUrl)
    }
}
