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
    let external: Bool? // added by Tom
    let rented: Bool? // added by Tom
    let costmodels: [Costmodel]?
    let defaultrole: String?
    let amount: Amount?
    let type: String
    let owningteam: Usergroup?
    let owninggroup: Usergroup?
    let abbreviation: String? // added by Tom
    let _type: LocationType // “location”
}

enum LocationType: String, Codable {
    case location
}
