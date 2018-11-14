//
//  Status.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation


struct Status: Codable {
    var url: String?
    var _type: StatusType
    var name: String?
    var backgroundcolor: String?
    var textcolor: String
    var statustypes: [String]?
}

enum StatusType: String, Codable {
    case status
}
