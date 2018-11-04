//
//  Overtimebonuspercentages.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 4/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Overtimebonuspercentages: Codable {
    let date: String
    let day: [OverworkTimePerPercentage]
    let week: [OverworkTimePerPercentage]
    let month: [OverworkTimePerPercentage]
}
