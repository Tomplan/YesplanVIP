//
//  Tasks.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 2/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Tasks: Codable {
    var pagination = Pagination()
    var data = [Task]()
}

//extension Tasks : ArrowParsable {
//    
//    public mutating func deserialize(_ json: JSON) {
//        pagination <-- json["pagination"]
//        data <-- json["data"]
//    }
//}
//
//extension Tasks: RestResource {
//    static func restName() -> String { return "api/tasks/" }
//    func restId() -> String { return "" }
//}
