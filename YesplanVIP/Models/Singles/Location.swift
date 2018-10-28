//
//  Location.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Location: Codable {
    let url: String
    let id: String
    let resourcetype: String
    let name: String
    let group: String?
    let roles: [String]? //
    let description: String?
    let external: Bool
    let rented: Bool
    let costmodels: [Costmodel]?
    let defaultrole: String?
    let amount: Int?
    let type: String
    let owningteam: Usergroup?
    let owninggroup: Usergroup?
    let abbreviation: String
    let _type = "location"                // “location”
}
