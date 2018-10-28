//
//  Usergroup.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Usergroup: Codable {
    
    var url: String = ""
    var id: String = ""
    var name: String?
}

extension Usergroup : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        url <-- json["url"]
        id <-- json["id"]
        name <-- json["name"]
    }
}

extension Usergroup: RestResource {
    static func restName() -> String { return "api/usergroup/" }
    func restId() -> String { return "\(id)" }
}
