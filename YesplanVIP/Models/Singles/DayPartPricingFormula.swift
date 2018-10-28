//
//  DayPartPricingFormula.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct DayPartPricingFormula: Codable {
    let amount: Int
    let per: String
    let includesvat: Bool
    let from: String
    let to: String
}