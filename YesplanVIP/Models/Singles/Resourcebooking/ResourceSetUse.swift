//
//  ResourceSetUse.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct ResourceSetUse: Codable {
    
    var url: String
    var id: String
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type = "resourcebooking"
    var number: Int // = 0
    var resource: Resource? // Resource Location_Id or Resource_Id or Placeholder_Id
    var children: [Resourcebooking]
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var resourceinstance: Base? // NOT Resourceinstance_Id
    var actualnumber: Int?
}
//
//extension ResourceSetUse: ArrowParsable {
//    mutating func deserialize(_ json: JSON) {
//        _type <-- json["_type"]
//        
//        url <-- json["url"]
//        id <-- json["id"]
//        owner <-- json["owner"]
//        owningteam <-- json["owningteam"]
//        owninggroup <-- json["owninggroup"]
//        number <-- json["number"]
//        resource <-- json["resource"]
//        //        do {
//        //            resource = try Resource(resource: json["resource"]!)!
//        //        } catch {
//        //            print(error)
//        //        }
//        number <-- json["number"]
//        event <-- json["event"]
//        role <-- json["role"]
//        resourceinstance <-- json["resourceinstance"]
//        actualnumber <-- json["actualnumber"]
//    }
//}
