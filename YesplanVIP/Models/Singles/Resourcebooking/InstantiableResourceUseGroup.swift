//
//  InstantiableResourceUseGroup.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct InstantiableResourceUseGroup: ArrowParsable, AutoCodable {
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
        do {
            resource = try Resource(resource: json["resource"]!)!
        } catch {
            print(error)
        }
        children <-- json["children"]
        event <-- json["event"]
        actualnumber <-- json["actualnumber"]
    }
}
