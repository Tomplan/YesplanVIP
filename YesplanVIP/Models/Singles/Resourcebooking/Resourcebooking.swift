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
    
    var start: String? {
        switch self {
        case .bulkResourceUse(let x): if let start = x.start { return start } else { return nil }
        case .freeFormResourceUse(let x): if let start = x.start { return start } else { return nil }
        case .instantiableResourceUse(let x): if let start = x.start { return start } else { return nil }
        case .instantiableResourceUseGroup(let x):
            for child in x.children { if let start = child.start { return start } else { return nil } }
        case .resourceSetUse(let x):
            for child in x.children { if let start = child.start { return start } else { return nil } }
    }
        return nil
    }
    
//    var end: String? {
//        switch self {
//        case .bulkResourceUse(let x): if let end = x.end { return end } else { return nil }
//        case .freeFormResourceUse(let x): if let end = x.end { return end } else { return nil }
//        case .instantiableResourceUse(let x): if let end = x.end { return end } else { return nil }
//        case .instantiableResourceUseGroup(let x):
//            for child in x.children { if let end = child.end { return end } else { return nil } }
//        case .resourceSetUse(let x): for child in x.children { return child.end } }
//        return nil
//    }
    
//    var eventName: String? {
//        switch self {
//        case .bulkResourceUse(let x): if let eventName = x.event?.name { return eventName } else { return nil }
//        case .freeFormResourceUse(let x): let eventName = x.event.name; return eventName
//        case .instantiableResourceUse(let x): if let eventName = x.event?.name { return eventName } else { return nil }
//        case .instantiableResourceUseGroup(let x):
//            for child in x.children { if let eventName = child.event?.name { return eventName } else { return nil } }
//        case .resourceSetUse(let x): for child in x.children { if let eventName =
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
            throw Failure.NotImplemented
        }
    }
}

extension Resourcebooking {
    private func analyze() {
        print("analyze")
    }
}
//extension Resourcebooking: Decodable {
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        let containers = try decoder.container(keyedBy: CodingKeys.self)
//        let type = try containers.decode(String.self, forKey: ._type)
//
//
//
////    switch type {
////        case "resourcebooking":
//////            print("resourcebooking")
////                if let x = try? container.decode(ResourceSetUse.self)
////                {
////                    print("ResourceSetUse")
////                    self = .resourceSetUse(x)
////                    return
////                }
////            else {
////            if let x = try? container.decode(InstantiableResourceUse.self) {
////                print("InstantiableResourceUse")
////                self = .instantiableResourceUse(x)
////                return
////            }
////            else {
////                if let x = try? container.decode(BulkResourceUse.self) {
////                    print("BulkResourceUse")
////                    self = .bulkResourceUse(x)
////                    return
////                }
////            else {
////                if let x = try? container.decode(FreeFormResourceUse.self) {
////                    print("FreeFormResourceUse")
////                    self = .freeFormResourceUse(x)
////                    return
////                }
////            else {
////                    throw Failure.NotImplemented
////                    }
////                }
////            }
////        }
////        case "resourcebookinggroup":
////            print("resourcebookinggroup")
////            if let x = try? container.decode(InstantiableResourceUseGroup.self) {
////                self = .instantiableResourceUseGroup(x)
////        }
////            throw Failure.NotImplemented
////
////        default:
////            throw Failure.NotImplemented
////        }
//    }
//}

//
//switch item {
//case  .instantiableResourceUse(let x):
//    print("type: instantiableResourceUse")
//    print("type: ", x._type)
//    print("url: ", x.url)
//case  .instantiableResourceUseGroup(let x):
//    print("type: instantiableResourceUseGroup")
//    print("type: ", x._type)
//    print("url: ", x.url)
//case  .resourceSetUse(let x):
//    print("type: resourceSetUse")
//    print("type: ", x._type)
//    print("url: ", x.url)
//case  .freeFormResourceUse(let x):
//    print("type: freeFormResourceUse")
//    print("type: ", x._type)
//    print("url: ", x.url)
//case  .bulkResourceUse(let x):
//    print("type: bulkResourceUse")
//    print("type: ", x._type)
//    print("url: ", x.url)
//}
