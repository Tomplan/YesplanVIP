//
//  ResourceSet.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct ResourceSet: ArrowParsable, AutoCodable {
    var url: URL = URL(string: "http://")!
    var id: String = ""
    var resourcetype: String?
    var name: String = ""
    var group: String?
    var roles: [String]?
    var description: String?
    var external: Bool = false
    var rented: Bool = false
    var costmodels: [Costmodel]?
    var type: String = ""
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type: String = ""
    var amount: Int?
    var resources: [Base] = []
    
    init() { guard self._type == "resource" else {
        return } }
    
    mutating func deserialize(_ json: JSON) {
        
        url <-- json["url"]
        id <-- json["id"]
        resourcetype <-- json["resourcetype"]
        name <-- json["name"]
        group <-- json["group"]
        roles <-- json["roles"]
        description <-- json["description"]
        external <-- json["external"]
        rented <-- json["rented"]
        costmodels <-- json["costmodels"]
        amount <-- json["amount"]
        type <-- json["type"]
        owner <-- json["owner"]
        owningteam <-- json["owningteam"]
        owninggroup <-- json["owninggroup"]
        _type <-- json["_type"]
        resources <-- json["resources"]
    }
}
