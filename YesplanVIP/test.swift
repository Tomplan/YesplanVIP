////
////  test.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 14/10/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
//    init(children: JSON) {
//        var value = Group()
//        value.deserialize(children)
////        print(value)
//        if value._type == "group" {
//            self = .group(value)
//
//        } else {
//            var e = Event()
//            e.deserialize(children)
//            self = .event(e)
//
//        }
//    }
//
//    init(encode: Children) {
//            switch encode {
//            case .event(let event):
//                print(event.url)
//            case .group(let group):
//                print("switch group")
//                print(group.url)
//        }
//    }
//
//    init?(resource: JSON) throws {
//        var a = BulkResource()
//        a.deserialize(resource)
//        if a._type == "resource" {
//            self = .bulkResource(a)
//            return
//        }
//        var b = AdHocResource()
//        b.deserialize(resource)
//        if b._type == "adhocresource" {
//            self = .adHocResource(b)
//            return
//        }
//        var c = InstantiableResource()
//        c.deserialize(resource)
//        if c._type == "resource" {
//            self = .instantiableResource(c)
//            return
//        }
//        var d = ResourceSet()
//        d.deserialize(resource)
//        if d._type == "resource" {
//            self = .resourceSet(d)
//            return
//        }
//        throw Failure.NotImplemented
//    }
//import Foundation
//
//import Arrow
//import then
//
//
//extension Resourcebooking {
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        switch self {
//        case .instantiableResourceUse(let resourcebooking): try container.encode(resourcebooking, forKey: .instantiableResourceUse)
//        case .instantiableResourceUseGroup(let resourcebooking): try container.encode(resourcebooking, forKey: .instantiableResourceUseGroup)
//        case .resourceSetUse(let resourcebooking): try container.encode(resourcebooking, forKey: .resourceSetUse)
//        case .freeFormResourceUse(let resourcebooking): try container.encode(resourcebooking, forKey: .freeFormResourceUse)
//        case .bulkResourceUse(let resourcebooking): try container.encode(resourcebooking, forKey: .bulkResourceUse)
//
//        }
//    }
//}

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
//typealias Decode<Result: Decodable, Key: CodingKey> = (KeyedDecodingContainer<Key>) throws -> Result?
//
//func decode<Result: Decodable, Key>(using container: KeyedDecodingContainer<Key>, cases: [Decode<Result, Key>]) throws -> Result {
//    guard let result = try cases.lazy.compactMap({ try $0(container) }).first
//        else { throw DecodingError.valueNotFound(Result.self, .init(codingPath: container.codingPath, debugDescription: "")) }
//
//    return result
//}
//
//func value<Result: Decodable, Key: CodingKey>(_ case: Result, for key: Key) throws -> Decode<Result, Key> {
//    return { container in
//        guard let _ = try container.decodeIfPresent(String.self, forKey: key) else { return nil }
//        return `case`
//    }
//}
//
//func value<Result: Decodable, Key: CodingKey, T: Decodable>(_ function: @escaping (T) -> Result, for key: Key) throws -> Decode<Result, Key> {
//    return { container in
//        guard let value = try container.decodeIfPresent(T.self, forKey: key) else { return nil }
//        return function(value)
//    }
//}
//typealias Decode<Result: Decodable, Key: CodingKey> = (KeyedDecodingContainer<Key>) throws -> Result?
//
//func decode<Result: Decodable, Key>(using container: KeyedDecodingContainer<Key>, cases: [Decode<Result, Key>]) throws -> Result {
//    guard let result = try cases.lazy.compactMap({ try $0(container) }).first
//        else { throw DecodingError.valueNotFound(Result.self, .init(codingPath: container.codingPath, debugDescription: "")) }
//    
//    return result
//}
//
//func value<Result: Decodable, Key: CodingKey>(_ case: Result, for key: Key) throws -> Decode<Result, Key> {
//    return { container in
//        guard let _ = try container.decodeIfPresent(String.self, forKey: key) else { return nil }
//        return `case`
//    }
//}
//
//func value<Result: Decodable, Key: CodingKey, T: Decodable>(_ function: @escaping (T) -> Result, for key: Key) throws -> Decode<Result, Key> {
//    return { container in
//        guard let value = try container.decodeIfPresent(T.self, forKey: key) else { return nil }
//        return function(value)
//    }
//}
//
//struct UUser: Codable {
//    let name: String
//    let url: URL
//}
//enum AuthState: Codable {
//    case loggedIn(UUser)
//    case loggedOut
//}
//
//extension AuthState {
//    private enum CodingKeys: String, CodingKey {
//        case loggedIn, loggedOut
//    }
//}
//extension AuthState {
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        switch self {
//        case .loggedIn(let user): try container.encode(user, forKey: .loggedIn)
//        case .loggedOut:          try container.encode(CodingKeys.loggedOut.stringValue, forKey: .loggedOut)
//        }
//    }
//}
//extension AuthState {
//    init(from decoder: Decoder) throws {
//        self = try decode(using: decoder.container(keyedBy: CodingKeys.self), cases: [
//            value(AuthState.loggedIn, for: .loggedIn),
//            value(AuthState.loggedOut, for: .loggedOut),
//            ]
//        )
//    }
//}
//
//let values: [AuthState] = [
//    .loggedIn(UUser(name: "Ian Keen", url: URL(string: "http://iankeen.tech")!)),
//    .loggedOut,
//]
//
//
