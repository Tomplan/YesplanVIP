//
//  Resource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

enum Resource {
    
    case bulkResource(BulkResource)
    case adHocResource(AdHocResource)
    case instantiableResource(InstantiableResource)
    case resourceSet(ResourceSet)
}

extension Resource: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bulkResource(let resource): try container.encode(resource)
        case .adHocResource(let resource): try container.encode(resource)
        case .instantiableResource(let resource): try container.encode(resource)
        case .resourceSet(let resource): try container.encode(resource)
        }
    }
}

extension Resource: Decodable {
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(BulkResource.self) {
            self = .bulkResource(x)
        } else if let x = try? container.decode(AdHocResource.self) {
            self = .adHocResource(x)
        } else if let x = try? container.decode(InstantiableResource.self) {
            self = .instantiableResource(x)
        } else if let x = try? container.decode(ResourceSet.self) {
            self = .resourceSet(x)
        } else {
            throw Failure.NotImplemented
        }
    }
}
