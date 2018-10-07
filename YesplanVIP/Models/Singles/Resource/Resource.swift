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

enum Resource {
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
        print("b")
        if b._type == "adhocresource" {
            self = .adHocResource(b)
            return
        }
        var c = InstantiableResource()
        c.deserialize(resource)
        print("c")
        if c._type == "resource" {
            self = .instantiableResource(c)
            return
        }
        var d = ResourceSet()
        d.deserialize(resource)
        print("d")
        if d._type == "resource" {
            self = .resourceSet(d)
            return
        }
        throw Failure.NotImplemented
    }
}

//
//struct Resource {
//
//    var url: String = ""
//    var id: String?
//    var name: String?
//    var _type: String?
//    var type: String = ""
//    //    init() {
//    //        print("base")
//    //        var b = Event()
//    //        //        b.deserialize(JSON(self)!)
//    //        //        print(b)
//    ////        self = .event(b)
//    //    }
//}
//
//extension Resource : ArrowParsable {
//
//    public mutating func deserialize(_ json: JSON) {
//        url <-- json["url"]
//        id <-- json["id"]
//        name <-- json["name"]
//        _type <-- json["_type"]
//        type <-- json["type"]
//    }
//}
