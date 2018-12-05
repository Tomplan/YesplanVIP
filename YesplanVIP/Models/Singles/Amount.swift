//
//  Amount.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 28/11/2018.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum Amount {
    case string(String)
    case double(Double)
}

extension Amount {
    enum CodingKeys: CodingKey {
        case string
        case double
    }
}
extension Amount: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .string(let value):
            try container.encode(value, forKey: .string)
        case .double(let value):
            try container.encode(value, forKey: .double)
        }
    }
}

extension Amount: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
        } else if
            let x = try? container.decode(Double.self) {
            self = .double(x)
        } else {
            print("hmmm?")
            throw Failure.NotImplemented
        }
    }
}

