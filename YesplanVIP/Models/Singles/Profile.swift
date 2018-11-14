//
//  Profile.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 23/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
//import Arrow

struct Profile: Codable {
    
    var url: URL
    var _type: ProfileType
    var id: String
    var name: String
    var color: String
}

enum ProfileType: String, Codable {
    case profile
}
