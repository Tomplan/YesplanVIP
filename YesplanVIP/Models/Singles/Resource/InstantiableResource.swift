//
//  InstantiableResource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct InstantiableResource: Codable {
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
    var amount: Amount? // important for resourcebooking!!!
    var type: String
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var _type: InstantiableResourceType
    var resourceinstances: [Resourceinstance]
}

enum InstantiableResourceType: String, Codable {
    case resource
}
