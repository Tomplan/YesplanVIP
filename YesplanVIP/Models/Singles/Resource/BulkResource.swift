//
//  BulkResource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct BulkResource: Codable {
    var url: URL
    var id: String
    var resourcetype: String?
    var name: String
    var group: String?
    var roles: [String]?
    var description: String?
    var external: Bool?
    var rented: Bool?
    var costmodels: [Costmodel]?
    var defaultrole: String?
    var amount: Int?
    var type: String // added by Tom !!!!!, really importantes!!!
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type: BulkResourceType
    var active: Bool? // added by Tom !!!!!, really importantes!!!
    var date: String?
    var productcode: String?
    var serialnumber: String?
}

enum BulkResourceType: String, Codable {
    case resource
}
