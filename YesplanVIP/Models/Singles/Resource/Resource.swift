//
//  Resource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

enum Resource: AutoCodable {
    
    case bulkResource(BulkResource)
    case adHocResource(AdHocResource)
    case instantiableResource(InstantiableResource)
    case resourceSet(ResourceSet)
    
    init?(resource: JSON) throws {
        var a = BulkResource()
        a.deserialize(resource)
        if a._type == "resource" {
            self = .bulkResource(a)
            return
        }
        var b = AdHocResource()
        b.deserialize(resource)
        if b._type == "adhocresource" {
            self = .adHocResource(b)
            return
        }
        var c = InstantiableResource()
        c.deserialize(resource)
        if c._type == "resource" {
            self = .instantiableResource(c)
            return
        }
        var d = ResourceSet()
        d.deserialize(resource)
        if d._type == "resource" {
            self = .resourceSet(d)
            return
        }
        throw Failure.NotImplemented
    }
}

extension Resource: RestResource {
    static func restName() -> String { return "api/resources/resource" }
    func restId() -> String { return "" }
}
