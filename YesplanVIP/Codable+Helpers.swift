//
//  Codable+Helpers.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 15/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

//import Foundation

//struct FailableDecodable<T: Swift.Decodable>: Swift.Decodable {
//    let value: T?
//    
//    init(from decoder: Swift.Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        self.value = try? container.decode(T.self)
//    }
//}
//
//struct NotEmptyDecodable<T: Swift.Decodable & Collection>: Swift.Decodable {
//    var value: T
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.singleValueContainer()
//        let value = try values.decode(T.self)
//        guard !value.isEmpty else {
//            throw decoder.dataCorrupted("Unexpected empty \(T.self)")
//        }
//        self.value = value
//    }
//    
//}
