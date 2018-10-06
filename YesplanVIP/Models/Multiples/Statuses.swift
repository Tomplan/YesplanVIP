//
//  Statuses.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 21/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Statuses {
    var pagination = Pagination()
    var data = [Status]()
}

extension Statuses : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        pagination <-- json["pagination"]
        data <-- json["data"]
    }
}

extension Statuses: RestResource {
    static func restName() -> String { return "api/statuses/" }
    func restId() -> String { return "" }
}
