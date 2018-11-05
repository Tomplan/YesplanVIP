//
//  InstantiableResourceUseGroup.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct InstantiableResourceUseGroup: Codable {
    var url: String // = ""
    var id: String // = ""
    var _type: String //= ""
    var number: Int // = 0
    var resource: Resource? // Resource Location_Id or Resource_Id or Placeholder_Id
    var children: [InstantiableResourceUse] // (instantiable resource use)*
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var actualnumber: Int?
//
//    init() {
//        let type = "resourcebookinggroup"
//        guard case self._type = type else {
//        return }
//        print("tttttttttttt")
//    }
}
//
//extension InstantiableResourceUseGroup: ArrowParsable {
//    mutating func deserialize(_ json: JSON) {
//        _type <-- json["_type"]
//        
//        url <-- json["url"]
//        id <-- json["id"]
//        number <-- json["number"]
//        resource <-- json["resource"]
////        do {
////            resource = try Resource(resource: json["resource"]!)!
////        } catch {
////            print(error)
////        }
//       
//        event <-- json["event"]
//        children <-- json["children"]
//        actualnumber <-- json["actualnumber"]
//    }
//    
//}
