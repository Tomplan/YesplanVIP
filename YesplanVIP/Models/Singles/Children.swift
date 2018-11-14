//
//  Children.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//


import Foundation

enum Children {

    case event(Event)
    case group(Group)
}


extension Children {
    
    private enum CodingKeys: String, CodingKey {
        case event
        case group
    }
}

extension Children: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .event(let child): try container.encode(child)
        case .group(let child): try container.encode(child)
        }
    }
}

extension Children: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Event.self) {
            self = .event(x)
        } else if let x = try? container.decode(Group.self) {
            self = .group(x)
        } else {
            throw Failure.NotImplemented
        }
    }
}


