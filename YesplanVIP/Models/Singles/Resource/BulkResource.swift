//
//  BulkResource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
//import Arrow

struct BulkResource: Codable {
    var url: URL = URL(string: "http://")!
    var id: String = ""
//    var resourcetype: String?
    var name: String = ""
//    var group: String?
//    var roles: [String]?
//    var description: String?
//    var external: Bool = false
//    var rented: Bool = false
//    var costmodels: [Costmodel]?
//    var defaultrole: String?
//    var amount: Int?
    var type: String = ""
//    var owner: User?
//    var owningteam: Usergroup?
//    var owninggroup: Usergroup?
    var _type: String = ""
//    var active: Bool = true
//    var date: String?
//    var productcode: String?
//    var serialnumber: String?

    init() { guard self._type == "resource" else {
        return } }
}
