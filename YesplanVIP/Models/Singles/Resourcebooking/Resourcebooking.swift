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

enum Failure: Error, AutoCodable {
    case NotImplemented
    case NoResourceBooking
    case NoResourceBookingGroup

}

enum Resourcebooking: AutoCodable {

    case instantiableResourceUse(InstantiableResourceUse)
    case instantiableResourceUseGroup(InstantiableResourceUseGroup)
    case resourceSetUse(ResourceSetUse)
    case freeFormResourceUse(FreeFormResourceUse)
    case bulkResourceUse(BulkResourceUse)
    
    init?(resourcebooking: JSON) throws {
        
        var a = InstantiableResourceUse()
        a.deserialize(resourcebooking)
        if a._type == "resourcebooking" {
            self = .instantiableResourceUse(a)
            return
        }
        a.deserialize(resourcebooking)
        if a._type == "resourcebooking" {
            self = .instantiableResourceUse(a)
            return
        }
        var b = InstantiableResourceUseGroup()
        b.deserialize(resourcebooking)
        if b._type == "resourcebookinggroup" {
            self = .instantiableResourceUseGroup(b)
            return
        }
        var c = ResourceSetUse()
        c.deserialize(resourcebooking)
        if c._type == "resourcebooking" {
            self = .resourceSetUse(c)
            return
        }
        var d = FreeFormResourceUse()
        d.deserialize(resourcebooking)
        if d._type == "resourcebooking" {
            self = .freeFormResourceUse(d)
            return
        }
        var e = BulkResourceUse()
        e.deserialize(resourcebooking)
        if e._type == "resourcebooking" {
            self = .bulkResourceUse(e)
            return
        }
        throw Failure.NotImplemented
    }
}

//extension Resourcebooking: RestResource {
//    static func restName() -> String { return "api/resourcebooking/" }
//    func restId() -> String { return "" }
//}
