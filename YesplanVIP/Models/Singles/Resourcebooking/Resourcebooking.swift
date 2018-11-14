//
//  Resourcebooking.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//
import Foundation
import PromisedFuture

enum Resourcebooking {
    case instantiableResourceUse(InstantiableResourceUse)
    case instantiableResourceUseGroup(InstantiableResourceUseGroup)
    case resourceSetUse(ResourceSetUse)
    case freeFormResourceUse(FreeFormResourceUse)
    case bulkResourceUse(BulkResourceUse)
    
    
//    var start: String? {
//        switch self {
//        case .bulkResourceUse(let x): let start = x.start; return start
//        case .freeFormResourceUse(let x): let start = x.start; return start
//        case .instantiableResourceUse(let x): let start = x.start; return start
//        case .instantiableResourceUseGroup(let x):
//            for child in x.children { let start = child.start; return start }
//        case .resourceSetUse(let x):
//            for child in x.children { if let start = child.start { return start } else { return nil } }
//    }
//        return nil
//    }

//    var end: String? {
//        switch self {
//        case .bulkResourceUse(let x): let end = x.end; return end
//        case .freeFormResourceUse(let x): let end = x.end; return end
//        case .instantiableResourceUse(let x): let end = x.end; return end
//        case .instantiableResourceUseGroup(let x):
//            for child in x.children { let end = child.end; return end }
//        case .resourceSetUse(let x):
//            for child in x.children {
//                if let end = child.end { return end } else { return nil } }
//        }
//        return nil
//        }

//    var eventName: String? {
//        switch self {
//        case .bulkResourceUse(let x): if let eventName = x.event?.name { return eventName } else { return nil }
//        case .freeFormResourceUse(let x): let eventName = x.event.name; return eventName
//        case .instantiableResourceUse(let x): if let eventName = x.event?.name { return eventName } else { return nil }
//        case .instantiableResourceUseGroup(let x):
//            if let eventName = x.event?.name { return eventName } else { return nil }
//        case .resourceSetUse(let x):
//            for child in x.children {
//                if let eventName = child.eventName { return eventName } else { return nil } }
//        }
//        return nil
//    }

//    var type: String? {
//        switch self {
//        case .bulkResourceUse(let x): if let type = x.resource?.type { return type } else { return nil }
//        case .freeFormResourceUse(let x): if let type = x.resource?.type { return type } else { return nil }
//        case .instantiableResourceUse(let x): if let type = x.resource?.type { return type } else { return nil }
//        case .instantiableResourceUseGroup(let x):
//            for child in x.children { if let type = child.resource?.type { return type } else { return nil } }
//        case .resourceSetUse(let x):
//            for child in x.children { if let type = child.type { return type } else { return nil } }
//        }
//        return nil
//    }
    
//    var resourceGroup: String? {
//        switch self {
//        case .bulkResourceUse(let x): if let resource = x.resource?.group { return resource } else { return nil }
//        case .freeFormResourceUse(let x): if let resource = x.resource?.group { return resource } else { return nil }
//        case .instantiableResourceUse(let x): if let resource = x.resource?.group { return resource } else { return nil }
//        case .instantiableResourceUseGroup(let x): if let resource = x.resource?.group { return resource } else { return nil }
//        case .resourceSetUse(let x): if let resource = x.resource?.group { return resource } else { return nil }
//        }
//        return nil
//    }
    
//    var Location: String? {
//        switch self {
//        case .bulkResourceUse(let x): if let location = x.event?.name { return eventName } else { return nil }
//        case .freeFormResourceUse(let x): let eventName = x.event.name; return eventName
//        case .instantiableResourceUse(let x): if let eventName = x.event?.name { return eventName } else { return nil }
//        case .instantiableResourceUseGroup(let x):
//            if let eventName = x.event?.name { return eventName } else { return nil }
//        case .resourceSetUse(let x):
//            for child in x.children {
//                if let end = child.end { return end } else { return nil } }
//        }
//        return nil
//    }
    
}

extension Resourcebooking {

    private enum CodingKeys: String, CodingKey {
        case _type
    }
}

extension Resourcebooking: Encodable {
    func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
        switch self {
        case .instantiableResourceUse(let resourcebooking): try container.encode(resourcebooking)
        case .instantiableResourceUseGroup(let resourcebooking): try container.encode(resourcebooking)
        case .resourceSetUse(let resourcebooking): try container.encode(resourcebooking)
        case .freeFormResourceUse(let resourcebooking): try container.encode(resourcebooking)
        case .bulkResourceUse(let resourcebooking): try container.encode(resourcebooking)
        }
    }
}

extension Resourcebooking: Decodable {
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
            print("shit")
            throw Failure.NotImplemented
        }
    }
}

