//
//  BulkResource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct BulkResource: ArrowParsable {
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
    var defaultrole: String?
    var amount: Int?
    var type: String = ""
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type: String = ""
    var active: Bool = true
    var date: String?
    var productcode: String?
    var serialnumber: String?

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
        defaultrole <-- json["defaultrole"]
        amount <-- json["amount"]
        type <-- json["type"]
        owner <-- json["owner"]
        owningteam <-- json["owningteam"]
        owninggroup <-- json["owninggroup"]
        _type <-- json["_type"]
        active <-- json["active"]
        date <-- json["date"]
        productcode <-- json["productcode"]
        serialnumber <-- json["serialnumber"]
    }
}
