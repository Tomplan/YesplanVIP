//
//  Costmodel.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct Costmodel: Codable {
    let name: String?
    let cost: String //  check
    let costformula: Formula
    let price: String
    let priceformula: Formula
    let account: String?
    let invoice: Bool
    let durationdiscount: DiscountFormula
    let volumediscount: DiscountFormula
    let purchaseprice: Double
    let vat: Double
    let profiles: [Profile]
}
