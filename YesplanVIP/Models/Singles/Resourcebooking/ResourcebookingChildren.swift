//
//  ResourcebookingChildren.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 19/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

indirect enum ResourcebookingChildren {
    case instantiableResourceUseGroup(InstantiableResourceUseGroup)
    case resourceSetUse(ResourceSetUse)
    case freeFormResourceUse(FreeFormResourceUse)
    case bulkResourceUse(BulkResourceUse)
}

extension ResourcebookingChildren {
    
    private enum CodingKeys: String, CodingKey {
        case _type
//        case children
//        case url
//        case actualnumber
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
        let containers = try decoder.container(keyedBy: CodingKeys.self)
        let type = try containers.decode(String.self, forKey: ._type)
        
        switch type {
        case "resourcebooking":
            //            if (try containers.decodeIfPresent(String.self, forKey: .children)) != nil
            //            {
            if let x = try? container.decode(ResourceSetUse.self)
            {
                print("ResourceSetUse")
                self = .resourceSetUse(x)
                return
            }
            else {
                if let x = try? container.decode(FreeFormResourceUse.self) {
                    self = .freeFormResourceUse(x)
                    return
                }
                else {
                    //            if (try containers.decodeIfPresent(String.self, forKey: .actualnumber)) != nil {
                    if let x = try? container.decode(BulkResourceUse.self) {
                        print("BulkResourceUse")
                        self = .bulkResourceUse(x)
                        return
                    }
                        else {
                            throw Failure.NotImplemented
                        }
                    }
                }
        case "resourcebookinggroup":
            print("resourcebookinggroup")
            //            if (try containers.decodeIfPresent(String.self, forKey: .children)) != nil {
            //                if let x = try? container.decode(InstantiableResourceUseGroup.self) {
            //                    self = .instantiableResourceUseGroup(x)
            //                    return
            //                }
            //                else {
            //                    throw Failure.NotImplemented
            //                }
            //            }
            //            else {
            //                throw Failure.NotImplemented
            //        }
            //            if let x = try? container.decode(InstantiableResourceUseGroup.self) {
            //                self = .instantiableResourceUseGroup(x)
            //        }
            throw Failure.NotImplemented
            
        default:
            throw Failure.NotImplemented
        }
    }
}
