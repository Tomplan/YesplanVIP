////
////  test.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 14/10/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
//import Foundation
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
