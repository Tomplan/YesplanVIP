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
                
        let status = task.status
            lblStatus.text = "Status: \n\t\(status)"
        
        if let name = task.name {
            lblName.text = "Name: \n\t\(name)"
        }
        
        if let partOf = task.event?.name {
            lblPartOf.text = "PartOf: \n\t\(partOf)"
        }
        
        if let description = task.description {
                   lblDescription.text = "Description: \n\t\(description)"
        }
        
        let cost = task.cost
            lblCost.text = "Cost: \n\t\(cost)"
        
        if let dueDate = task.due {
            lblDueDate.text = ("DueDate: \n\t\( dueDate.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm") ?? "not set")")
        }
        
        if let startDate = task.start {
            lblStartDate.text = ("StartDate: \n\t\( startDate.convertDateString(dateFormat: "EEEE, dd MMMM yyyy - HH:mm") ?? "not set")")
        }
        
        let duration = task.duration
            lblDuration.text = "Duration: \n\t\(duration)"
        
        let team = task.team
            lblTeam.text = "Team: \n\t\(team)"
        
        if let assignedTo = task.assignedto {
            lblAssignedTo.text = "AssignedTo: \n\t\(assignedTo)"
        }
            
        if let assignedBy = task.assignedby {
            lblAssignedBy.text = "AssignedBy: \n\t\(assignedBy)"
        }
        
        let yesplanID = task.id
            lblYesplanID.text = "YesplanID: \n\t\(yesplanID)"
    }
}
