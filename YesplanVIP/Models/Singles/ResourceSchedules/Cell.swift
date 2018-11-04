//
//  Cell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 4/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Cell: Codable {
    let planned: String
    let actual: String?
    let overtime: String?
    let undertime: String?
}
