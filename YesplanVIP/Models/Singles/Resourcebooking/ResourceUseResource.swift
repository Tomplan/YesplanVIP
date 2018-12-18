//
//  BulkResourceUseResource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum ResourceUseResource {
    case location(Location)
    case resource(Resource)
    case resourceplaceholder(Resourceplaceholder)
    
    var type: String {
        switch self {
        case .location(let x): let type = x.type; return type
        case .resource(let x): let type = x.type; return type
        case .resourceplaceholder(let x): let type = x.type; return type
        }
    }
    
    var id: String {
        switch self {
        case .location(let x): let id = x.id; return id
        case .resource(let x): let id = x.id; return id
        case .resourceplaceholder(let x): let id = x.id; return id
        }
    }
    
    var name: String {
        switch self {
        case .location(let x): let name = x.name; return name
        case .resource(let x): let name = x.name; return name
        case .resourceplaceholder(let x): let name = x.name; return name
        }
    }
    
    var group: String? {
        switch self {
        case .location(let x): if let group = x.group { return group } else { return nil }
        case .resource(let x): if let group = x.group { return group } else { return nil }
        case .resourceplaceholder(let x): if let group = x.group { return group } else { return nil }
        }
    }
}


extension ResourceUseResource: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .location(let location): try container.encode(location)
        case .resource(let resource): try container.encode(resource)
        case .resourceplaceholder(let resourceplaceholder): try container.encode(resourceplaceholder)
        }
    }
}

extension ResourceUseResource: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Location.self)
        { self = .location(x); return }
            else { if let x = try? container.decode(Resource.self)
        { self = .resource(x); return }
            else { if let x = try? container.decode(Resourceplaceholder.self)
        { self = .resourceplaceholder(x); return }
            else { throw Failure.NotImplemented }
            }
        }
    }
}

