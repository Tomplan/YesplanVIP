//
//  BulkResourceUse.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct BulkResourceUse: Codable {
    
    var url: String
    var id: String
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type = "resourcebooking"
    var number: Int // = 0
    var resource: BulkResourceUseResource? // Resource Location_Id or Resource_Id or Placeholder_Id
    var start: String? // added by tom!!! // timestamp
    var end: String? // added by tom!!! // timestamp
    var actualstart: String? // timestamp
    var actualend: String? // timestamp
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var role: String?
    var actualnumber: String?
}
//
//extension BulkResourceUse: ArrowParsable {
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
//        start <-- json["start"]
//        end <-- json["end"]
//        actualstart <-- json["actualstart"]
//        actualend <-- json["actualend"]
//        event <-- json["event"]
//        role <-- json["role"]
//    }
//}
