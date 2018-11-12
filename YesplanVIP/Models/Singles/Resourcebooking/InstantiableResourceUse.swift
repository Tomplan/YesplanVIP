//
//  InstantiableResourceUse.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct InstantiableResourceUse: Codable {
    
    var url: String // = ""
    var id: String // = ""
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    let _type = "resourcebooking"
    var number: Int? // = 0
    var resource: Resource? // Resource Location_Id or Resource_Id or Placeholder_Id
    var start: String? // added by tom!!! // timestamp
    var end: String? // added by tom!!! // timestamp
    var actualstart: String? // timestamp
    var actualend: String? // timestamp
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var role: String?
    var resourceinstance: Base // NOT Resourceinstance_Id
    
    
//    init() { guard self._type == "resourcebooking" else {
//        return } }
}
