//
//  Resourcebookings.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Resourcebookings {
    var pagination = Pagination()
    var data: [Resourcebooking] = []
}

extension Resourcebookings : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        pagination <-- json["pagination"]
        data = [Resourcebooking]()
        if let items = json["data"]?.collection {
            for item in items {
                do {
                    let booking = try Resourcebooking(resourcebooking: item)
                    data.append(booking!)
                } catch {
                    print(error)
                }
            }
        }
    }
}

extension Resourcebookings: RestResource {
    static func restName() -> String { return "api/resourcebookings/" }
    func restId() -> String { return "" }
}
