//
//  Profiles.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 23/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Profiles: Codable {
    var pagination = Pagination()
    var data = [Profile]()
}
//
//extension Profiles : ArrowParsable {
//    
//    public mutating func deserialize(_ json: JSON) {
//        pagination <-- json["pagination"]
//        data <-- json["data"]
//    }
//}

extension Profiles: RestResource {
    static func restName() -> String { return "api/profiles/" }
    func restId() -> String { return "" }
}
