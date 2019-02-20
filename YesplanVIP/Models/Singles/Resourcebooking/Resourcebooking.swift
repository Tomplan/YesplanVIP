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
    
    var resource: ResourceUseResource {
        switch self {
        case .bulkResourceUse(let x): let y = x.resource; return y
        case .freeFormResourceUse(let x): let y = x.resource; return y
        case .instantiableResourceUse(let x): let y = x.resource; return y
        case .instantiableResourceUseGroup(let x): let y = x.resource; return y
        case .resourceSetUse(let x): let y = x.resource; return y
        }
    }
    
    var _type: String {
        switch self {
        case .bulkResourceUse(let x): let type = x._type.rawValue; return type
        case .freeFormResourceUse(let x): let type = x._type.rawValue; return type
        case .instantiableResourceUse(let x): let type = x._type.rawValue; return type
        case .instantiableResourceUseGroup(let x): let type = x._type.rawValue; return type
        case .resourceSetUse(let x): let type = x._type.rawValue; return type
        }
    }
    
    var type: String {
        switch self {
        case .bulkResourceUse(let x): let type = x.resource.type; return type
        case .freeFormResourceUse(let x): let type = x.resource.type; return type
        case .instantiableResourceUse(let x): let type = x.resource.type; return type
        case .instantiableResourceUseGroup(let x): let type = x.resource.type; return type
//        case .resourceSetUse(let x): let type = x.resource.type; return type
        case .resourceSetUse(let x):
            let type = x.children.compactMap { $0.type}
            print("type:", type)
            ; return type[0]
            // MARK: TODO, 
        }
    }
    
    var id: String {
        switch self {
        case .bulkResourceUse(let x): let id = x.id; return id
        case .freeFormResourceUse(let x): let id = x.id; return id
        case .instantiableResourceUse(let x): let id = x.id; return id
        case .instantiableResourceUseGroup(let x): let id = x.id; return id
        case .resourceSetUse(let x): let id = x.id; return id
        }
    }

    var start: String? {
        switch self {
        case .bulkResourceUse(let x): let start = x.start ; return start
        case .freeFormResourceUse(let x): let start = x.start ; return start
        case .instantiableResourceUse(let x): let start = x.start; return start
        case .instantiableResourceUseGroup(let x):
            for child in x.children { let start = child.start; return start }
//            print(x)
        case .resourceSetUse(let x):
            print(x)
//            for child in x.children { if let start = child.start { return start } else { return nil } }
    }
        return nil
    }

    var end: String? {
        switch self {
        case .bulkResourceUse(let x): let end = x.end; return end
        case .freeFormResourceUse(let x): let end = x.end; return end
        case .instantiableResourceUse(let x): let end = x.end; return end
        case .instantiableResourceUseGroup(let x):
            for child in x.children { let end = child.end; return end }
        case .resourceSetUse(let x):
            print(x)
//            while x.children.count != 0 {
//            for child in x.children {
//                if let end = child.end { return end } else { return nil } }
//            }
        }
        return nil
        }

    var eventName: String? {
        switch self {
        case .bulkResourceUse(let x): if let eventName = x.event?.name { return eventName } else { return nil }
        case .freeFormResourceUse(let x): let eventName = x.event.name; return eventName
        case .instantiableResourceUse(let x): if let eventName = x.event?.name { return eventName } else { return nil }
        case .instantiableResourceUseGroup(let x):
            if let eventName = x.event?.name { return eventName } else { return nil }
        case .resourceSetUse(_):
            return nil
//            for child in x.children {
//                if let eventName = child { return eventName } else { return nil } }
        }
    }
    
//    var resourceType: String {
//        switch self {
//        case .bulkResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.type
//        case .none:
//            return ""
//            }
//        case .freeFormResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.type
//        case .none:
//            return ""
//            }
//        case .instantiableResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.type
//        case .none:
//            return ""
//            }
//        case .instantiableResourceUseGroup(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.type
//        case .none:
//            return ""
//            }
//        case .resourceSetUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.type
//        case .none:
//            return ""
//            }
//        }
//    }
//
//    var resourceName: String {
//        switch self {
//        case .bulkResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.name
//        case .none:
//            return ""
//            }
//        case .freeFormResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.name
//        case .none:
//            return ""
//            }
//        case .instantiableResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.name
//        case .none:
//            return ""
//            }
//        case .instantiableResourceUseGroup(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.name
//        case .none:
//            return ""
//            }
//        case .resourceSetUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.name
//        case .none:
//            return ""
//            }
//        }
//    }
//
//    var resourceId: String {
//        switch self {
//        case .bulkResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.id
//        case .none:
//            return ""
//            }
//        case .freeFormResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.id
//        case .none:
//            return ""
//            }
//        case .instantiableResourceUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.id
//        case .none:
//            return ""
//            }
//        case .instantiableResourceUseGroup(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.id
//        case .none:
//            return ""
//            }
//        case .resourceSetUse(let x): let res = x.resource
//        switch res {
//        case .some(let x):
//            return x.id
//        case .none:
//            return ""
//            }
//        }
//    }
    
    
    var childId: [String] {
        switch self {
        case .bulkResourceUse(_): return []
        case .freeFormResourceUse(_): return []
        case .instantiableResourceUse(_): return []
        case .instantiableResourceUseGroup(let x): let res = x.children.compactMap { $0.id }; return { res }()
        case .resourceSetUse(let x): let res = x.children.compactMap { $0.id }; return { res }()
        }
    }
    
    var childType: [String] {
        switch self {
        case .bulkResourceUse(_): return []
        case .freeFormResourceUse(_): return []
        case .instantiableResourceUse(_): return []
        case .instantiableResourceUseGroup(let x): let res = x.children.compactMap { $0.resource.type }; return { res }()
        case .resourceSetUse(let x): let res = x.children.compactMap { $0.resource.type }; return { res }()
        }
    }
//
////    var type: String? {
////        switch self {
////        case .bulkResourceUse(let x): if let type = x.resource?.type { return type } else { return nil }
////        case .freeFormResourceUse(let x): if let type = x.resource?.type { return type } else { return nil }
////        case .instantiableResourceUse(let x): if let type = x.resource?.type { return type } else { return nil }
////        case .instantiableResourceUseGroup(let x):
////            for child in x.children { if let type = child.resource?.type { return type } else { return nil } }
////        case .resourceSetUse(let x):
////            for child in x.children { if let type = child.type { return type } else { return nil } }
////        }
////        return nil
////    }
//    
////    var resourceGroup: String? {
////        switch self {
////        case .bulkResourceUse(let x): if let resource = x.resource?.group { return resource } else { return nil }
////        case .freeFormResourceUse(let x): if let resource = x.resource?.group { return resource } else { return nil }
////        case .instantiableResourceUse(let x): if let resource = x.resource?.group { return resource } else { return nil }
////        case .instantiableResourceUseGroup(let x): if let resource = x.resource?.group { return resource } else { return nil }
////        case .resourceSetUse(let x): if let resource = x.resource?.group { return resource } else { return nil }
////        }
////        return nil
////    }
//    
//    var Children: String? {
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
            print("chips")
            throw Failure.NotImplemented
        }
    }
}

extension Resourcebooking {
    func unfold()  -> CollectionViewViewModelProtocol {
        let grid = Grid(columns: 1, margin: UIEdgeInsets(all: 8))

        switch self {
        case .bulkResourceUse(let x):
//            print("bulk:", x.resource.name)
            let item = EDTeamViewModel(self)
            return item
        case .freeFormResourceUse(let x):
//            print("free:", x.resource.name)
            let item = EDTeamViewModel(self)
            return item
        case .instantiableResourceUse(let x):
//            print("inst:", x.resource.name)
            let item = EDTeamViewModel(self)
            return item
        case .instantiableResourceUseGroup(let x):
//            print("group:", x.resource.name)
            
            let item = EDTeamViewModel(self)
            return item
            
        case .resourceSetUse(let x):
//            print("set:", x.resource.name)
            
            let multiheader = DynamicTextViewModel(x.resource.name)
            let items = x.children.map { resourcebooking -> CollectionViewViewModelProtocol in
                resourcebooking.unfold()
            }
            let section =  CollectionViewSection(header: multiheader, items: items)
            
            let k = CollectionViewSource(grid: grid, sections: [section])
//            let k = CollectionViewSource(sections: [section])

            let l = CollectionViewModel(k)
            return l
        }
    }
}
