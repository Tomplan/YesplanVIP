//
//  UnitPricingFormula.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct UnitPricingFormula: Codable {
    let customcalculationquantity: Double?
    let customcalculationminimum: Double?
    let customcalculationunit: String?
    let amount: Double
    let per: String
    let includesvat: Bool
}
