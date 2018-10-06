//
//  Resourcebooking.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

enum Failure : Error {
    case NotImplemented
}

enum Resourcebooking {

    case instantiableResourceUse(InstantiableResourceUse)
    case instantiableResourceUseGroup(InstantiableResourceUseGroup)
//    case null
    
    init?(resourcebooking: JSON) throws {
        var b = InstantiableResourceUseGroup()
        b.deserialize(resourcebooking)
        if b._type == "resourcebookinggroup" {
            self = .instantiableResourceUseGroup(b)
            return
        }
        var a = InstantiableResourceUse()
        a.deserialize(resourcebooking)
        if a._type == "resourcebooking" {
            self = .instantiableResourceUse(a)
            return
        }
         throw Failure.NotImplemented
    }
}

struct InstantiableResourceUse: ArrowParsable {
    
    var url = URL(string: "http://")!
    var id: String = ""
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type = "resourcebookinggroup"
    var number: Int = 0
    var resource: Resource? // Resource Location_Id or Resource_Id or Placeholder_Id
    var start: String? // added by tom!!! // timestamp
    var end: String? // added by tom!!! // timestamp
    var actualstart: String? // timestamp
    var actualend: String? // timestamp
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var role: String?
    var resourceinstance: Base? // NOT Resourceinstance_Id
    
    
    init() { guard self._type == "resourcebooking" else {
        return } }

    mutating func deserialize(_ json: JSON) {
        _type <-- json["_type"]
        
        url <-- json["url"]
        id <-- json["id"]
        owner <-- json["owner"]
        owningteam <-- json["owningteam"]
        owninggroup <-- json["owninggroup"]
        number <-- json["number"]
        resource <-- json["resource"]
        start <-- json["start"]
        end <-- json["end"]
        actualstart <-- json["actualstart"]
        actualend <-- json["actualend"]
        event <-- json["event"]
        role <-- json["role"]
        resourceinstance <-- json["resourceinstance"]
    }
}

struct InstantiableResourceUseGroup: ArrowParsable {
    var url = URL(string: "http://")!
    var id: String = ""
    var _type = "resourcebookinggroup"
    var number: Int = 0
    var resource: Resource? // Resource Location_Id or Resource_Id or Placeholder_Id
    var children: Base? // (instantiable resource use group | resource set use | free form resource use | bulk resource use)*
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var actualnumber: Int?
    
    init() { guard self._type == "resourcebookinggroup" else {
        return } }

    mutating func deserialize(_ json: JSON) {
        _type <-- json["_type"]
        
        url <-- json["url"]
        id <-- json["id"]
        number <-- json["number"]
        resource <-- json["resource"]
        children <-- json["children"]
        event <-- json["event"]
        actualnumber <-- json["actualnumber"]
    }
}


extension Resourcebooking: RestResource {
    static func restName() -> String { return "api/resourcebooking/" }
    func restId() -> String { return "" }
}
