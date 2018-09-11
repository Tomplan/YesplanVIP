//
//  User.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct User {
    
    var url: String = ""
    var id: String = ""
    var name: String?
    var email: String?
}

extension User : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        url <-- json["url"]
        id <-- json["id"]
        name <-- json["name"]
        email <-- json["email"]
    }
}

extension User: RestResource {
    static func restName() -> String { return "api/user" }
    func restId() -> String { return "\(id)" }
}
