//
//  DayPartSetPricingFormula.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct DayPartSetPricingFormula: Codable {
    let per: String
    let dayparts: DayPartPricingFormula
}
