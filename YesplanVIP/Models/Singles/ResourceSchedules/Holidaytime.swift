//
//  Holidaytime.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 4/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct HolidayTime: Codable {
    let date: String
    let useduntildate: String?
    let availableondate: String?
    let yearUsed: String?
    let yearAvailable: String?
}
