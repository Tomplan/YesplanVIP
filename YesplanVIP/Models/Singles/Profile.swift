//
//  Profile.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 23/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct Profile {
    
    var url: String = ""
    var _type: String = ""
    var id: String = ""
    var name: String = ""
    var color: String = ""
}

extension Profile : ArrowParsable {

    public mutating func deserialize(_ json: JSON) {
        
        url <-- json["url"]
        _type <-- json["_type"]
        id <-- json["id"]
        name <-- json["name"]
        color <-- json["color"]
    }
}

    extension Profile: RestResource {
        static func restName() -> String { return "api/profile/" }
        func restId() -> String { return "\(id)" }
}
