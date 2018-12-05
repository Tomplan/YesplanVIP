//
//  InstantiableResourceUse.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct InstantiableResourceUse: Codable {
    
    var url: URL
    var id: String
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    let _type: InstantiableResourceUseType
    var number: Double
    var resource: ResourceUseResource? // Resource Location_Id or Resource_Id or Placeholder_Id
    var start: String // added by tom!!! // timestamp
    var end: String // added by tom!!! // timestamp
    var actualstart: String? // timestamp
    var actualend: String? // timestamp
    var unpublished: Bool?
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var role: String?
    var resourceinstance: Base? // added by tom!!! // NOT Resourceinstance_Id
    
}

enum InstantiableResourceUseType: String, Codable {
    case resourcebooking
}
