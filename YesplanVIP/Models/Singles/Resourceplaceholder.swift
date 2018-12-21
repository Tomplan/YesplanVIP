//
//  Resourceplaceholder.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Resourceplaceholder: Codable {
    let url: String
    let id: String
    let resourcetype: String // optional added by TOM
    let name: String // optional added by TOM ???
    let group: String?
    let roles: [String] // optional added by TOM
    let description: String?
    let external: Bool? // optional added by TOM, very mportantes!!!!
    let rented: Bool? // optional added by TOM, very mportantes!!!!
    let costmodels: [Costmodel]? // optional added by TOM,  very mportantes!!!!
    let defaultrole: String? // optional added by TOM
    let amount: String?
    let type: String
    let _type: ResourceplaceholderType
}

enum ResourceplaceholderType: String, Codable {
    case resourceplaceholder
}
