//
//  TeamplannerWorker.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 13/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import PromisedFuture

class TeamplannerTabWorker
{
//    func getResourcebookings(_ path: String) -> Future<Resourcebookings> {
//        return Future(operation: { completion in
//            APIClient.resourcebookings("\(path)")
//                .map({$0})
//                .execute(onSuccess: { items in
//                    completion(.success(items))
//                }, onFailure: { error in
//                    completion(.failure(error))
//                })
//        })
//    }
    
        

//    func getResources(_ path: String) -> Future<Resources> {
//        return Future(operation: { completion in
//            APIClient.resources("\(path)")
//                .map({$0})
//                .execute(onSuccess: { items in
//                    completion(.success(items))
//                }, onFailure: { error in
//                    completion(.failure(error))
//                })
//        })
//    }
    
    func getResourceSchedulesFromTo(_ path: String) -> Future<ResourceSchedulesFromTo> {
        return Future(operation: { completion in
            APIClient.resourcesSchedulesFromTo("\(path)")
                .map({$0})
                .execute(onSuccess: { items in
                    completion(.success(items))
                }, onFailure: { error in
                    completion(.failure(error))
                })
        })
    }
    
//    func resourceSchedulesFromToAnalyze(_ resourceSchedulesFromTo: ResourceSchedulesFromTo) {
//        for resourceScheduleFromTo in resourceSchedulesFromTo.data {
//            if let schedules = resourceScheduleFromTo.schedules {
//                //                print("schedules")
//                for schedule in schedules {
//                    switch schedule {
//                    case .lock(let x):
//                        print("lock")
//                        print(x.start)
//                        print(x.end)
//                        print(x.scheduletype)
//                    case .schedule(let x):
//                        print("schedule")
//                        print(x.start)
//                        print(x.end)
//                        print(x.scheduletype)
//                        let resourcebooking = x.resourcebooking
//                        if let resourcebookingId = resourcebooking.id {
//                            getResourcebookingId(resourcebookingId)
//                                .map({$0})
//                                .execute(onSuccess: { items in
//                                    print(items)
//                                }, onFailure: { error in
//                                    print(error)
//                                })
//                        }
//                    case .scheduleBreak(let x):
//                        print("break")
//                        print(x.start)
//                        print(x.end)
//                        print(x.scheduletype)
//                    case .shift(let x):
//                        print("shift")
//                        print(x.start)
//                        print(x.end)
//                        print(x.scheduletype)
//                    }
//                }
//            }
//        }
//    }
}
//    func groupResourecbookingsByStartdate(resourcebookings: Resourcebookings) -> [String:[Resourcebooking]] {
//        for resourcebooking in resourcebookings.data {
//            switch resourcebooking {
//            case .instantiableResourceUse(let x):
//                if x.resource?.type == "Human" {
//                    fetchedResourcebookings[x.start!] = resourcebooking
//                }
//            case .instantiableResourceUseGroup(let _):
//                print("neeije")
////                if x.resource?.type == "Human" {
//////                    fetchedResourcebookings[x.start!] = resourcebooking
//////                }
//            }
//        }
////        let dictResourcebookings = Dictionary(grouping: fetchedResourcebookings, by: { $0.key })
////        return dictResourcebookings
//    }
//}
