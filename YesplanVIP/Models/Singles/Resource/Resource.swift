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
    
    var url: URL {
        switch self {
        case .bulkResource(let x): let url = x.url; return url
        case .adHocResource(let x): let url = x.url; return url
        case .instantiableResource(let x): let url = x.url; return url
        case .resourceSet(let x): let url = x.url; return url
        }
    }
    
    var id: String {
        switch self {
        case .bulkResource(let x): let id = x.id; return id
        case .adHocResource(let x): let id = x.id; return id
        case .instantiableResource(let x): let id = x.id; return id
        case .resourceSet(let x): let id = x.id; return id
        }
    }
    
    var name: String {
        switch self {
        case .bulkResource(let x): let name = x.name; return name
        case .adHocResource(let x): let name = x.name; return name
        case .instantiableResource(let x): let name = x.name; return name
        case .resourceSet(let x): let name = x.name; return name
        }
    }
    
    var type: String {
        switch self {
        case .bulkResource(let x): let type = x.type; return type
        case .adHocResource(let x): let type = x.type; return type
        case .instantiableResource(let x): let type = x.type; return type
        case .resourceSet(let x): let type = x.type; return type
        }
    }
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
