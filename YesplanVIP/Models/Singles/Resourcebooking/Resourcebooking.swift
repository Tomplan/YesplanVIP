//
//  Resourcebooking.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

enum Failure : Error {
    case NotImplemented
}

enum Resourcebooking {

    case instantiableResourceUse(InstantiableResourceUse)
    case instantiableResourceUseGroup(InstantiableResourceUseGroup)
    case resourceSetUse(ResourceSetUse)

//    case null
    
    init?(resourcebooking: JSON) throws {
        var b = InstantiableResourceUseGroup()
        b.deserialize(resourcebooking)
        if b._type == "resourcebookinggroup" {
            self = .instantiableResourceUseGroup(b)
            return
        }
        var a = InstantiableResourceUse()
        a.deserialize(resourcebooking)
        if a._type == "resourcebooking" {
            self = .instantiableResourceUse(a)
            return
        }
         throw Failure.NotImplemented
    }
}

//extension Resourcebooking: RestResource {
//    static func restName() -> String { return "api/resourcebooking/" }
//    func restId() -> String { return "" }
//}
