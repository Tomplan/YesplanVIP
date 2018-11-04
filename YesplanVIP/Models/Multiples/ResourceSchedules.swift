////
////  ResourceSchedules.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 7/10/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
import Foundation
//import Arrow
//
struct ResourceSchedulesFromTo: Codable {
    var pagination = Pagination()
    var data = [ResourceScheduleFromTo]()
}
//
//extension ResourcesSchedules: ArrowParsable {
//    
//    public mutating func deserialize(_ json: JSON) {
//        pagination <-- json["pagination"]
//        data <-- json["data"]
//        //        data = [Resourcebooking]()
////        if let items = json["data"]?.collection {
////            print(items)
////            for item in items {
//////                item <-- json["data"]
//////                do {
//////                    let booking = try ResourceSchedule(item)
////                    //                    switch booking! {
////                    //                    case .instantiableResourceUse(let x):
////                    //                        if let resource = x.resource {
////                    //                            print("resource: ", resource)
////                    //                            switch resource {
////                    //                            case .bulkResource(let x):
////                    //                                print(x._type)
////                    //                            case .adHocResource(let x):
////                    //                                print(x._type)
////                    //                            case .instantiableResource(let x):
////                    //                                print(x._type)
////                    //                            case .resourceSet(let x):
////                    //                                print(x._type)
////                    //                            }
////                    //                        }
////                    //                    case .instantiableResourceUseGroup(let x):
////                    //                        print("x", x)
////                    //                    }
////                    data.append(booking!)
////                } catch {
////                    print(error)
////                }
////            }
////        }
//    }
//}
//
//extension ResourcesSchedules: RestResource {
//    static func restName() -> String { return "api/resources/resource" }
//    func restId() -> String { return "" }
//}
