//
//  Base.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Base: Codable {
    
    var url: String = ""
    var id: String?
    var name: String?
    var _type: String?
    
//    init() {
//        print("base")
//        var b = Event()
//        //        b.deserialize(JSON(self)!)
//        //        print(b)
////        self = .event(b)
//    }
}

extension Base : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        url <-- json["url"]
        id <-- json["id"]
        name <-- json["name"]
        _type <-- json["_type"]
    }
}

struct Base2: Codable {
    
    var url: String?
    var id: String?
    var name: String?
    var _type: String?
}
