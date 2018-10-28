//
//  Status.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//


import Foundation
import Arrow
//import then

struct Status: AutoCodable {
    
    var url: String?
    var _type = "status"
    var name: String?
    var backgroundcolor: String?
    var textcolor: String = ""
    var statustypes: [String]? = [""]
}
//
//extension Status : ArrowParsable {
//    
//    public mutating func deserialize(_ json: JSON) {
//        url <-- json["url"]
//        _type <-- json["_type"]
//        name <-- json["name"]
//        backgroundcolor <-- json["backgroundcolor"]
//        textcolor <-- json["textcolor"]
//        statustypes <-- json["statustypes"]
//
//    }
//}

extension Status: RestResource {
    static func restName() -> String { return "api/status/" }
    func restId() -> String { return "\(name!)" }
}

//extension Status {
//    func fetchStatus(id: String) -> Promise<Status> {
//        return api.fetchStatus(id: id)
//    }
//}
