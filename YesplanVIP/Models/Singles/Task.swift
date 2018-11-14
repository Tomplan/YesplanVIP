//
//  Task.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 2/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Task: Codable {
    var url: URL
    var id: String
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var status: String
    var name: String?
    var team: String
    var cost: Int = 0
    var due: String? // = "no deadline" //timestamp
    var start: String? //timestamp
    var description: String?
    var event: Base2?    //
    var assignedby: String?
    var assignedto: String?
    var duration: String?

}
