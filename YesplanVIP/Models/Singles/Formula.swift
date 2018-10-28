//
//  Formula.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum Formula {
    case unitPricingFormula(UnitPricingFormula)
    case fixedPricingFormula(FixedPricingFormula)
    case dayPartSetPricingFormula(DayPartSetPricingFormula)
}

extension Formula: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .unitPricingFormula(let formula): try container.encode(formula)
        case .fixedPricingFormula(let formula): try container.encode(formula)
        case .dayPartSetPricingFormula(let formula): try container.encode(formula)
        }
    }
}

extension Formula: Decodable {
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(UnitPricingFormula.self) {
            self = .unitPricingFormula(x)
        } else if let x = try? container.decode(FixedPricingFormula.self) {
            self = .fixedPricingFormula(x)
        } else if let x = try? container.decode(DayPartSetPricingFormula.self) {
            self = .dayPartSetPricingFormula(x)
        } else {
            throw Failure.NotImplemented
        }
    }
}
