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
import PromiseKit

class TeamplannerTabWorker
{
    func getResourcesSchedulesFromTo(_ path: String) -> Promise<ResourcesSchedulesFromTo> {
        return firstly {
            APIClient.resourcesSchedulesFromTo("\(path)")
            }
//            .map({$0})
    }
    
    
    
//    func getResourcesSchedulesFromTo() -> Promise<ResourcesSchedulesFromTo> {
//        let requestString: String = "https://\(UserDefaults.standard.string(forKey: "URL")!)/api/resources/resource%3Aname%3Atom%20slegers/schedules?from=2018-12-04&to=2018-12-14&api_key=\(UserDefaults.standard.string(forKey: "KEY")!)"
////        print("url: ", requestString)
//
//        guard let url = URL(string: requestString) else {
//            print("urlerror: ")
//            
//            return Promise(error: APIError.responseUnsuccessful)
//        }
////        print("url: ", url)
//        return
//            firstly {
//                URLSession.shared.dataTask(.promise, with: url)
//                }.validate()
//                .map {
//                    try JSONDecoder().decode(ResourcesSchedulesFromTo.self, from: $0.data)
//        }
//    }
    //
    //
    //    func getResourcebookings(_ ids: [String]) -> Promise<[Resourcebooking]> {
    //
    //        }
    
    func getResourcebookingId(_ id: String) -> Promise<Resourcebooking>? {
        return firstly {
            APIClient.resourcebookingId("\(id)")
        }
        //            .map({$0})
    }
    
//    func getResourcebookingId(_ id: String?) -> Promise<Resourcebooking>? {
//        guard let myid = id else { return Promise(error: APIError.responseUnsuccessful) }
//        let requestString: String = "https://\(UserDefaults.standard.string(forKey: "URL")!)/api/resourcebooking/\(myid)?api_key=\(UserDefaults.standard.string(forKey: "KEY")!)"
//        print("url: ", requestString)
//        guard let url = URL(string: requestString) else {
//            print("urlerror: ")
//
//            return Promise(error: APIError.responseUnsuccessful)
//        }
////        print("url: ", url)
//        return
//            firstly {
//                URLSession.shared.dataTask(.promise, with: url)
//                }.validate()
//                .map {
//                    try JSONDecoder().decode(Resourcebooking.self, from: $0.data)
//        }
//
//    }

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
    
//    func getResourcesSchedulesFromTo(_ path: String) -> Future<ResourcesSchedulesFromTo> {
//        return Future(operation: { completion in
//            APIClient.resourcesSchedulesFromTo("\(path)")
//                .execute(onSuccess: { items in
//                    completion(.success(items))
//                }, onFailure: { error in
//                    completion(.failure(error))
//                })
//        })
//    }
//    
//    func getResourcebookingId(_ id: String) -> Future<Resourcebooking> {
//        return Future(operation: { completion in
//            APIClient.resourcebookingId(id)
//                .execute(onSuccess: { item in
//                    completion(.success(item))
//                }, onFailure: { error in
//                    completion(.failure(error))
//                })
//            })
//        }
    
//    func promiseResourcesSchedulesFromTo(resourcesSchedulesFromTo: ResourcesSchedulesFromTo) -> [Resourcebooking]? {
////        var array: [Resourcebooking]? = []
////
//        return firstly {
//            for schedules in resourcesSchedulesFromTo.data {
//                for schedule in schedules {
//        
//                }
//            }
//        }
//    }

//    func makeSchedulesArray(resourcesSchedulesFromTo: ResourcesSchedulesFromTo) -> Future<[String? : [Schedules]]> {
//        var schedulesDict = [String? : [Schedules]]()
////        var bookingIdArray = [String]()
//
//        for resourceSchedulesFromTo in resourcesSchedulesFromTo.data {
//            var schedulesArray = [Schedules]()
////            var future = Future(value: bookingArray)
//
//             let schedules = resourceSchedulesFromTo.schedules
//                for schedule in schedules {
////                     let resourcebooking = schedule.eventName
//////                        resourcebooking.execute { (result) in
//////                            switch result {
//////                            case .success(let x):
//////                                print(x.name)
//////                                bookingArray.append(x)
//////                                print(future.execute(onSuccess: { item in print(item)}))
//////
//////                            case .failure(let x):
////                    print(resourcebooking.execute(completion: { (result) in
////                        switch result {
////                        case .success(let x):
////                            print(x)
////                        case .failure(let x):
////                            print(x)
////
////                        }
////                    }))
//////                            }
//////                        }
//                    schedulesArray.append(schedule)
//                }
//                schedulesDict[resourceSchedulesFromTo.resource.name] = schedulesArray
//            
//        }
//        return Future(value: schedulesDict)
//    }
//        
//        
//        
//        
////        
////        if let next = resourcesSchedulesFromTo.pagination.next  {
////            print(next)
////            if let url = URL(string: next) {
////                print("absoluteString: ", url.absoluteString)
////                print("absoluteURL: ", url.absoluteURL)
////                print("baseURL: ", url.baseURL)
////                print("path: ", url.path)
////                print("query: ", url.query)
////            getNextResourcesSchedulesFromTo(url: url)
////                .execute(onSuccess: { dfg in
//////                    print(dfg)
////                    
////                }, onFailure: { error in
////                    print(error)
////                })
////            }
////        } else {
////            return Future(value: schedulesDict)
////        }
////        return Future(value: schedulesDict)
////    }
//    
    func getNextResourcesSchedulesFromTo(url: URL) -> Future<ResourcesSchedulesFromTo> {
        print("getNextResourcesSchedulesFromTo")
        return Future(operation: { completion in
            APIClient.nextResourcesSchedulesFromTo(url)
                //                .map({$0})
                .execute(onSuccess: { items in
//                    print("getNextResourcesSchedulesFromToitems: ", items)
                    completion(.success(items))
                }, onFailure: { error in
                    print(error)
                    completion(.failure(error))
                })
        })
        
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
}
