//
//  Resourcebooking.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//
import Foundation
//import Foundation
//import Arrow
//import then

typealias Decode<Result: Decodable, Key: CodingKey> = (KeyedDecodingContainer<Key>) throws -> Result?

func decode<Result: Decodable, Key>(using container: KeyedDecodingContainer<Key>, cases: [Decode<Result, Key>]) throws -> Result {
    guard let result = try cases.lazy.compactMap({ try $0(container) }).first
        else { throw DecodingError.valueNotFound(Result.self, .init(codingPath: container.codingPath, debugDescription: "")) }
    
    return result
}

func value<Result: Decodable, Key: CodingKey>(_ case: Result, for key: Key) throws -> Decode<Result, Key> {
    return { container in
        guard let _ = try container.decodeIfPresent(String.self, forKey: key) else { return nil }
        return `case`
    }
}

func value<Result: Decodable, Key: CodingKey, T: Decodable>(_ function: @escaping (T) -> Result, for key: Key) throws -> Decode<Result, Key> {
    return { container in
        guard let value = try container.decodeIfPresent(T.self, forKey: key) else { return nil }
        return function(value)
    }
}
enum Failure: Error, AutoCodable {
    case NotImplemented
    case NoResourceBooking
    case NoResourceBookingGroup

}

enum Resourcebooking: Codable {
    case instantiableResourceUse(InstantiableResourceUse)
    case instantiableResourceUseGroup(InstantiableResourceUseGroup)
    case resourceSetUse(ResourceSetUse)
    case freeFormResourceUse(FreeFormResourceUse)
    case bulkResourceUse(BulkResourceUse)
}
//    init?(resourcebooking: JSON) throws {
//
//        var a = InstantiableResourceUse()
//        a.deserialize(resourcebooking)
//        if a._type == "resourcebooking" {
//            self = .instantiableResourceUse(a)
//            return
//        }
//        a.deserialize(resourcebooking)
//        if a._type == "resourcebooking" {
//            self = .instantiableResourceUse(a)
//            return
//        }
//        var b = InstantiableResourceUseGroup()
//        b.deserialize(resourcebooking)
//        if b._type == "resourcebookinggroup" {
//            self = .instantiableResourceUseGroup(b)
//            return
//        }
//        var c = ResourceSetUse()
//        c.deserialize(resourcebooking)
//        if c._type == "resourcebooking" {
//            self = .resourceSetUse(c)
//            return
//        }
//        var d = FreeFormResourceUse()
//        d.deserialize(resourcebooking)
//        if d._type == "resourcebooking" {
//            self = .freeFormResourceUse(d)
//            return
//        }
//        var e = BulkResourceUse()
//        e.deserialize(resourcebooking)
//        if e._type == "resourcebooking" {
//            self = .bulkResourceUse(e)
//            return
//        }
//        throw Failure.NotImplemented
//    }
//}

//extension Resourcebooking: RestResource {
//    static func restName() -> String { return "api/resourcebooking/" }
//    func restId() -> String { return "" }
//}
//
extension Resourcebooking {

    private enum CodingKeys: String, CodingKey {
        case instantiableResourceUse
        case instantiableResourceUseGroup
        case resourceSetUse
        case freeFormResourceUse
        case bulkResourceUse
    }
}
//
extension Resourcebooking {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .instantiableResourceUse(let resourcebooking): try container.encode(resourcebooking, forKey: .instantiableResourceUse)
        case .instantiableResourceUseGroup(let resourcebooking): try container.encode(resourcebooking, forKey: .instantiableResourceUseGroup)
        case .resourceSetUse(let resourcebooking): try container.encode(resourcebooking, forKey: .resourceSetUse)
        case .freeFormResourceUse(let resourcebooking): try container.encode(resourcebooking, forKey: .freeFormResourceUse)
        case .bulkResourceUse(let resourcebooking): try container.encode(resourcebooking, forKey: .bulkResourceUse)

        }
    }
}
//
extension Resourcebooking {
    init(from decoder: Decoder) throws {

        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(InstantiableResourceUse.self) {
            self = .instantiableResourceUse(x)
        } else if let x = try? container.decode(InstantiableResourceUseGroup.self) {
            self = .instantiableResourceUseGroup(x)
        } else if let x = try? container.decode(ResourceSetUse.self) {
            self = .resourceSetUse(x)
        } else if let x = try? container.decode(FreeFormResourceUse.self) {
            self = .freeFormResourceUse(x)
        } else if let x = try? container.decode(BulkResourceUse.self) {
            self = .bulkResourceUse(x)
        } else {
            throw Failure.NotImplemented
        }
    }
}

