//
//  DiscountFormula.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct DiscountFormula: Codable {
    let type: String
    let notation: String
    let rates: [[Double]]
}
