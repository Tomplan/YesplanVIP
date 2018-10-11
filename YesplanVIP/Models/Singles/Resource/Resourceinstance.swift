//
//  Resourceinstance.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct Resourceinstance: ArrowParsable, AutoCodable {
    var _type: String = ""
    var id: String = ""
    var url: URL = URL(string: "http://")!
    var resource: Base? // NOT Resource_Id
    var active: Bool?
    var date: String?
    var productcode: String?
    var serialnumber: String?
    
    mutating func deserialize(_ json: JSON) {
        _type <-- json["_type"]
        id <-- json["id"]
        url <-- json["url"]
        resource <-- json["resource"]
        active <-- json["active"]
        date <-- json["date"]
        productcode <-- json["productcode"]
        serialnumber <-- json["serialnumber"]
    }
}
