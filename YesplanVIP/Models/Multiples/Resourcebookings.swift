//
//  Resourcebookings.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

struct Resourcebookings: Codable {
    var pagination = Pagination()
    var data = [Resourcebooking]()
}

//extension Resourcebookings : ArrowParsable {
//
//    public mutating func deserialize(_ json: JSON) {
//        pagination <-- json["pagination"]
//        data <-- json["data"]
//
////        data = [Resourcebooking]()
////        if let items = json["data"]?.collection {
////            for item in items {
////                do {
//////                    var x: Resourcebooking
//////                    x <-- json["Resourcebooking"]
////                    print("item: ", item)
//////                    switch item {
//////                        case
//////                    }
//////                    let booking = try Resourcebooking(resourcebooking: item)
//////                    switch booking! {
//////                    case .instantiableResourceUse(let x):
//////                        if let resource = x.resource {
//////                            print("resource: ", resource)
//////                            switch resource {
//////                            case .bulkResource(let x):
//////                                print(x._type)
//////                            case .adHocResource(let x):
//////                                print(x._type)
//////                            case .instantiableResource(let x):
//////                                print(x._type)
//////                            case .resourceSet(let x):
//////                                print(x._type)
//////                            }
//////                        }
//////                    case .instantiableResourceUseGroup(let x):
//////                        print("x", x)
//////                    }
//////                    data.append(booking!)
////                } catch {
////                    print(error)
////                }
////            }
////        }
//    }
//}

extension Resourcebookings: RestResource {
    static func restName() -> String { return "api/resourcebookings/" }
    func restId() -> String { return "" }
}
