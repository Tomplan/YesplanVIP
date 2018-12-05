//
//  DayPartSetPricingFormula.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct DayPartSetPricingFormula: Codable {
    let customcalculationquantity: Double?
    let customcalculationminimum: Double?
    let customcalculationunit: String?
    let per: String
    let dayparts: [DayPartPricingFormula]
}
