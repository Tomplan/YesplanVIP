//
//  Groups.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Groups: AutoCodable {
    var pagination = Pagination()
    var data = [Group]()
}

extension Groups : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        pagination <-- json["pagination"]
        data <-- json["data"]
    }
}

extension Groups: RestResource {
    static func restName() -> String { return "api/groups/" }
    func restId() -> String { return "" }
}
