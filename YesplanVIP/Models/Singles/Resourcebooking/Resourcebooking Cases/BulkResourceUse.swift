//
//  BulkResourceUse.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct BulkResourceUse: Codable {
    
    var url: String
    var id: String
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type: BulkResourceUseType
    var number: Double
    var resource: ResourceUseResource // Resource Location_Id or Resource_Id or Placeholder_Id
    var start: String // added by tom!!! // timestamp
    var end: String // added by tom!!! // timestamp
    var actualstart: String? // timestamp
    var actualend: String? // timestamp
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var role: String?
    var actualnumber: String?
}

enum BulkResourceUseType: String, Codable {
    case resourcebooking
}