//
//  TeamplannerTabViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Foundation

extension TeamplannerTabViewCell {
    
        func populate(with item: TeamplannerTab.Something.ViewModel.Section.Row) {

        lblName.textColor = UIColor(r: 64, g: 64, b: 64)
        lblStart.textColor = UIColor(r: 64, g: 64, b: 64)

            if let absent = item.schedules {
                 lblName.text = absent.scheduletype
                if let start = absent.start.convertDateString(dateFormat: "HH:mm") {
                    if let end = absent.end.convertDateString(dateFormat: "HH:mm") {
                lblStart.text = "• \(start) - \(end)"
                    }
                }
                if absent.scheduletype == "shift" {
                    lblName.textColor = UIColor(r: 158, g: 103, b: 0)
                }
                if absent.scheduletype == "break" {
                    lblName.textColor = UIColor(r: 158, g: 103, b: 0)
                }
                if absent.scheduletype == "unavailability" {
                    lblName.textColor = UIColor(r: 238, g: 0, b: 0)
                }
            }

            if let present = item.resourcebooking {

                lblName.text = present.eventName
                if let start = present.start?.convertDateString(dateFormat: "HH:mm") {
                    if let end = present.end?.convertDateString(dateFormat: "HH:mm") {
                        self.lblStart.text = "• \(start) - \(end)"
                    }
                }
            }
    }
}
