//
//  TasksTabViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 29/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Kingfisher

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension TasksTabViewCell {
    
    func populate(with task: Task) {
        
        if let start = task.start {
            lblStart.text = "start: \(String(describing: start.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm")!))"}
        
        if let name = task.name {
             lblName.text = name }
        
        if task.due != "no deadline" {
            lblDeadline.text = "deadline: \(String(describing: task.due.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm")!))"
        } else {
            lblDeadline.text = "no deadline"
        }
        
        if let assignedTo = task.assignedto {
            lblAssignedTo.text = assignedTo }
    }
}
