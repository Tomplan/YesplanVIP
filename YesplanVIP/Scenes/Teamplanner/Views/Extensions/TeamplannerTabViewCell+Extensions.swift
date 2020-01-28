//
//  TeamplannerTabViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Foundation
//import Kingfisher

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension TeamplannerTabViewCell {
    
//    func populate(with item: TeamplannerTab.Something.ViewModel.Section) {
        func populate(with item: TeamplannerTab.Something.ViewModel.Section.Row) {

        lblName.textColor = UIColor(r: 64, g: 64, b: 64)
        lblStart.textColor = UIColor(r: 64, g: 64, b: 64)
        
//        let item =
//        let name = item.scheduletype
//            lblName.text = name
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
//                print("present: ", present)
                if let start = present.start?.convertDateString(dateFormat: "HH:mm") {
                    if let end = present.end?.convertDateString(dateFormat: "HH:mm") {
                        self.lblStart.text = "• \(start) - \(end)"
                    }
                }
            }
////                present.eventName
////                    .execute { result in
////                        switch result {
////                        case .success(let x):
////                            self.lblName.text = x
////                            if let start = present.start.convertDateString(dateFormat: "HH:mm") {
////                                if let end = present.end.convertDateString(dateFormat: "HH:mm") {
////                                    self.lblStart.text = "• \(start) - \(end)"
////                                }
////                            }
////
////                        case .failure(let x):
////                            print(x)
////
////                        }
////                }
////                if let start = present.start.convertDateString(dateFormat: "HH:mm") {
////                    if let end = present.end.convertDateString(dateFormat: "HH:mm") {
////                        lblStart.text = "• \(start) - \(end)"
////                    }
////                }
////
//            }
//
//
//    }
//
//    func populate2(with item: Resourcebooking) {
//
//                    if let name = item.name {
//                        self.lblName.text = name
//        }
//                if let start = item.start?.convertDateString(dateFormat: "HH:mm") {
//                    if let end = item.end?.convertDateString(dateFormat: "HH:mm") {
//                lblStart.text = "• \(start) - \(end)"
//                    }
//                }
//    }
//
////            lblStart.text = "• \(start) - \(end)"
////            //        let role = resourcebooking.role
////
////        } else {
////            if item.scheduletype == "shift" {
////                lblName.textColor = UIColor(r: 158, g: 103, b: 0)
////            }
////            if item.scheduletype == "break" {
////                lblName.textColor = UIColor(r: 158, g: 103, b: 0)
////            }
////            if item.scheduletype == "unavailability" {
////                lblName.textColor = UIColor(r: 238, g: 0, b: 0)
////            }
////            lblName.text = item.scheduletype
////            lblStart.text = "• \(start) - \(end)"
////        }
////        if let defaultschedulestarttime = event.defaultschedulestarttime {
////            lblDefaultschedulestarttime.text = defaultschedulestarttime}
////        if let locations = event.locations {
////            if locations.count != 0 {
////                if let location = locations[0].name {
////                    lblLocation.text = location } } }
////        if let groupName = event.group!.name {
////            lblGroupName.text = groupName }
//
}
}
