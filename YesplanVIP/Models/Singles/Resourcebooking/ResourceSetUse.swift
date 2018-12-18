//
//  ResourceSetUse.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct ResourceSetUse: Codable {
    
    var url: String
    var id: String
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type: ResourceSetUseType
    var number: Double
    var resource: ResourceUseResource // Resource Location_Id or Resource_Id or Placeholder_Id
    var children: [Resourcebooking]
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var resourceinstance: Base? // NOT Resourceinstance_Id
    var actualnumber: Double?
}

enum ResourceSetUseType: String, Codable {
    case resourcebooking
}
