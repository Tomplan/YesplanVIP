//
//  ResourcebookingChildren.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import PromisedFuture

indirect enum ResourcebookingChildren {
    case instantiableResourceUseGroup(InstantiableResourceUseGroup)
    case resourceSetUse(ResourceSetUse)
    case freeFormResourceUse(FreeFormResourceUse)
    case bulkResourceUse(BulkResourceUse)
    
    var start: String? {
        switch self {
        case .instantiableResourceUseGroup(let x):
            for child in x.children { if let start = child.start { return start } else { return nil } }
        case .resourceSetUse(let x): for child in x.children {
            if let start = child.start { return start } else { return nil } }
        case .freeFormResourceUse(let x): if let start = x.start { return start } else { return nil }
        case .bulkResourceUse(let x): if let start = x.start { return start } else { return nil }
        }
        return nil
    }
    
    var end: String? {
        switch self {
        case .instantiableResourceUseGroup(let x):
            for child in x.children { if let end = child.end { return end } else { return nil } }
        case .resourceSetUse(let x): for child in x.children {
            if let end = child.end { return end } else { return nil } }
        case .freeFormResourceUse(let x): if let end = x.end { return end } else { return nil }
        case .bulkResourceUse(let x): if let end = x.end { return end } else { return nil }
        }
        return nil
    }
    
    var eventName: String? {
        switch self {
        case .instantiableResourceUseGroup(let x):
            for child in x.children { if let eventName = child.event?.name { return eventName } else { return nil } }
        case .resourceSetUse(let x): for child in x.children {
            if let eventName = child.eventName { return eventName } else { return nil } }
        case .freeFormResourceUse(let x): if let eventName = x.event.name { return eventName } else { return nil }
        case .bulkResourceUse(let x): if let eventName = x.event?.name { return eventName } else { return nil }
        }
        return nil
    }
    
    var type: String? {
        switch self {
        case .instantiableResourceUseGroup(let x):
            for child in x.children { if let type = child.resource?.type { return type } else { return nil } }
        case .resourceSetUse(let x): for child in x.children {
            if let type = child.type { return type } else { return nil } }
        case .freeFormResourceUse(let x): if let type = x.resource?.type { return type } else { return nil }
        case .bulkResourceUse(let x): if let type = x.resource?.type { return type } else { return nil }
        }
        return nil
    }
}

extension ResourcebookingChildren {
    
    private enum CodingKeys: String, CodingKey {
        case _type
    }
}

extension ResourcebookingChildren: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .instantiableResourceUseGroup(let resourcebooking): try container.encode(resourcebooking)
        case .resourceSetUse(let resourcebooking): try container.encode(resourcebooking)
        case .freeFormResourceUse(let resourcebooking): try container.encode(resourcebooking)
        case .bulkResourceUse(let resourcebooking): try container.encode(resourcebooking)
        }
    }
}

extension ResourcebookingChildren: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(InstantiableResourceUseGroup.self) {
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
