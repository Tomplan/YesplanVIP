//
//  ResourceSet.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct ResourceSet: Codable {
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
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type: ResourceSetType
    var amount: Amount
    var resources: [Base]?
}

enum ResourceSetType: String, Codable {
    case resource
}
