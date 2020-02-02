//
//  ToDosTabViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Kingfisher

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension ToDosTabViewCell {
    
    func populate(with task: Task) {
        
        if task.status == "New" {
            lblName.textColor = KFCrossPlatformColor(r: 238, g: 0, b: 0)
        }
        if task.status == "Started" {
            lblName.textColor = KFCrossPlatformColor(r: 100, g: 100, b: 0)
        }
        if task.status == "Done" {
            lblName.textColor = KFCrossPlatformColor(r: 100, g: 100, b: 0)
        }
        if task.status == "On Hold" {
            lblName.textColor = KFCrossPlatformColor(r: 100, g: 100, b: 100)
        }
        if task.status == "Obsolete" {
            lblName.textColor = KFCrossPlatformColor(r: 0, g: 0, b: 238)
        }
        
        if let start = task.start {
            lblStart.text = "start: \(String(describing: start.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm")!))"}
        
        if let name = task.name {
            lblName.text = name }
        
        if task.due == "no deadline" {
            lblDeadline.text = task.due
        } else if task.due == "Keep up the good work!" {
            lblDeadline.text = task.due
            lblDeadline.textAlignment = .center
            lblName.textAlignment = .center
            lblStart.text = ""
        } else if let due = task.due {
                lblDeadline.text = "deadline: \(String(describing: due.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm")!))"
            }
         else {
            lblDeadline.text = "no deadline"
        }
        if let assignedTo = task.assignedto {
            lblAssignedTo.text = assignedTo }
    }
}
