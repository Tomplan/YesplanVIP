//
//  Resourceinstance.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Resourceinstance: Codable {
    var _type: Type
    var id: String
    var url: URL
    var resource: Base? // NOT Resource_Id
    var active: Bool?
    var date: String?
    var productcode: String?
    var serialnumber: String?
}

