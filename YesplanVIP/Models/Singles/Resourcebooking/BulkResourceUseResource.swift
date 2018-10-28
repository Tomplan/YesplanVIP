//
//  BulkResourceUseResource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum BulkResourceUseResource {
    case location(Location)
    case resource(Resource)
    case resourceplaceholder(Resourceplaceholder)
}


extension BulkResourceUseResource: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .location(let location): try container.encode(location)
        case .resource(let resource): try container.encode(resource)
        case .resourceplaceholder(let resourceplaceholder): try container.encode(resourceplaceholder)
        }
    }
}

extension BulkResourceUseResource: Decodable {
    //    private enum CodingKeys: String, CodingKey {
    //        case type
    //    }
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
//        let containers = try decoder.container(keyedBy: CodingKeys.self)
//        let type = try containers.decode(String.self, forKey: ._type)
        if let x = try? container.decode(Location.self)
            {
            print("location")
            self = .location(x)
            return
            }
            else {
                if let x = try? container.decode(Resource.self)
                {
                    print("resource")
                    self = .resource(x)
                    return
                }
            else {
                if let x = try? container.decode(Resourceplaceholder.self)
                {
                    print("resourceplaceholder")
                    self = .resourceplaceholder(x)
                    return
                }
            else {
                throw Failure.NotImplemented
                }
            }
        }
    }
}

