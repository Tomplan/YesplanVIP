//
//  Events.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Events {
    var pagination = Pagination()
    var data = [Event]()
}

extension Events : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        pagination <-- json["pagination"]
        data <-- json["data"]
    }
}

extension Events: RestResource {
    static func restName() -> String { return "api/events" }
    func restId() -> String { return "" }
}

//extension Events {
//    static func fetchEvents() -> Promise<Events> {
//        return api.fetchEvents()
//    }
//}