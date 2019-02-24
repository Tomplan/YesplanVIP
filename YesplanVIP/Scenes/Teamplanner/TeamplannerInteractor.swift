//
//  TeamplannerInteractor.swift
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

protocol TeamplannerTabBusinessLogic
{
  func doSomething(request: TeamplannerTab.Something.Request)
}

protocol TeamplannerTabDataStore
{
  //var name: String { get set }
}

class TeamplannerTabInteractor: TeamplannerTabBusinessLogic, TeamplannerTabDataStore
{
  var presenter: TeamplannerTabPresentationLogic?
  var worker: TeamplannerTabWorker?
//    var resourcebookingArray: [Resourcebooking]? = []
//    var finalArray: [Resourcebooking]? = []
    var dict: [[String? : [Schedules]]] = []

  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: TeamplannerTab.Something.Request)
  {
//    var resourceSchedulesArray: [ResourceSchedulesFromTo] = []
//    var resourcebookingsArray: [Resourcebooking] = []
//    var resourcebookingArray: [Resourcebooking] = []
//    var scheduleArray: [Schedules] = []
//    let error: String? = ""
    
//    print("resourcebookingsArray: ", resourcebookingsArray)
    worker = TeamplannerTabWorker()
//    print("joep")
//    worker?.getResourcesSchedulesFromTo("resource:name:\(String(describing: UserDefaults.standard.string(forKey: "todo_user")!))")
//        .map { $0.data }
//        .flatMapValues { item  in return item.schedules.compactMap { $0.id }
        worker?.getResourcesSchedulesFromTo("resource:name:\(String(describing: UserDefaults.standard.string(forKey: "todo_user")!))")
            .map { $0.data
            } .get { fromTos in
                self.dict = fromTos.compactMap { [$0.resource.name : $0.schedules]}
//            }.tap { result in
//                print("r", result)
            }.flatMapValues { item  in return item.schedules.compactMap { $0.id }
//            }.tap { result in print("2", result)
            }.thenMap { item -> Promise<Resourcebooking> in (self.worker?.getResourcebookingId(item)!)!
//            }.tap { result in print("3", result)
            }.done { result in
//                print("result:", result)
                let response = TeamplannerTab.Something.Response(
                    resourcebookings: result,
                    schedules: self.dict,
                    error: nil
                )
                ////                            resourcebookings: nil, stringSchedules: items,
                ////                            error: nil)
                self.presenter?.presentSomething(response: response)
                
            }.catch { error in
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
    }
                //                print("dict:", self.dict)
                //                print("array:", self.array)
        //            worker?.getResourcesSchedulesFromTo("resource:team:1203")

//    .andThen(worker?.getNextResourcesSchedulesFromTo(url: ))
//                .andThen(worker?.getNextResourcesSchedulesFromTo(url: ))
//        .andThen((worker?.makeSchedulesArray)!)
//        .andThen({ res -> Future<[ResourceSchedulesFromTo]> in
////            print(res)
//            return Future(value: res.data)
//        })
//        .map ({ scheduleslist -> [String] in
//            print(scheduleslist.flatMap { item  in return item.schedules.compactMap { $0.id }})
//            return (scheduleslist.flatMap { item  in return item.schedules.compactMap { $0.id }})
//        })
//        .andThen({ schedules -> Future<[[String]]> in
////            print(schedules)
//            return Future(value: schedules.compactMap { $0.compactMap { $0.id} })
//        })
////                .andThen(worker?.getNextResourcesSchedulesFromTo)
//        .execute(onSuccess:  { items in
////            print(items)
////            for item in items {
////                for value in item.value {
////                    switch value {
////                    case .schedule(let x):
////                        if let id = x.resourcebooking.id {
////                            x.getResourcebookingId(id)
////                                .andThen({ (resourcebooking) -> Future<[Resourcebooking]?> in
////                                    self.resourcebookingArray?.append(resourcebooking)
////                                    return Future(value: self.resourcebookingArray)
////                                })
////                                .execute(onSuccess: { (array) in
////                                    let response = TeamplannerTab.Something.Response(
////                                        resourcebookings: array, stringSchedules: items,
////                                        error: nil)
////                                    self.presenter?.presentSomething(response: response)
////                                })
////                        }
////                    default:
////                        let response = TeamplannerTab.Something.Response(
////                            resourcebookings: nil, stringSchedules: items,
////                            error: nil)
////                        self.presenter?.presentSomething(response: response)
////                    }
////                }
////            }
////            self.presenter?.presentSomething(response: response)
//
//        }, onFailure: { error in
//            print(error)
//        })

    
//    worker?.getResourcesSchedulesFromTo("resource:name:\(String(describing: UserDefaults.standard.string(forKey: "todo_user")!))")
//        .map({$0.data.forEach({ (res) in
//            res.schedules?.forEach({ (schedules) in
//                if let id = schedules.id {
//                    self.worker?.getResourcebookingId(id)
//                        .andThen({ (res) -> Future<[Resourcebooking]> in
//                            self.resourcebookingArray.append(res)
//                            return Future(value: self.resourcebookingArray)
//                        })
//                        .execute(onSuccess: { (array) in
////                            print(array)
//                            let response = TeamplannerTab.Something.ResourcebookingsResponse(Resourcebookings: array)
//                            self.presenter?.presentResourcebookings(response: response)
//                            self.presenter?.presentSomething(response: <#T##TeamplannerTab.Something.Response#>)
//                        })
//
//
//                }
//            })
//        })})
//        .execute(onSuccess: { (item) in
//            print(item)
//        })
    

//// ***************************
//            .execute(onSuccess: { resourcesSchedulesFromTo in
////                print("pagination: ", resourcesSchedulesFromTo.pagination)
////                print("data: ", resourcesSchedulesFromTo.data)
//
//            for resourceSchedulesFromTo in resourcesSchedulesFromTo.data {
//                if let schedules = resourceSchedulesFromTo.schedules {
//                    for schedule in schedules {
//                        switch schedule {
//                        case .shift(let x):
//                            scheduleArray.append(schedule)
//                        case .scheduleBreak(let x):
//                            scheduleArray.append(schedule)
//                        case .lock(let x):
//                            scheduleArray.append(schedule)
//                        case .schedule(let x):
//                                if let resourcebookingId = schedule.id {
//                                    self.worker?.getResourcebookingId(resourcebookingId)
//                                        .execute(onSuccess: { item in
//                                            resourcebookingArray.append(item)
////                                            print("resourcebookingArray: ", resourcebookingArray)
//                                        }, onFailure: { error in
//                                            print("error")
//                                        })
//
//                                }
//                            }
//                        }
//                    print("scheduleArray: ", scheduleArray)
////                        if let resourcebookingId = schedule.id {
////                            print(resourcebookingId)
////                        self.worker?.getResourcebookingId(resourcebookingId)
////                            .execute(onSuccess: { items in
////                                print(items)
////                            }, onFailure: { error in
////                                print("error")
////                            })
////                        }
////                    }
//                }
//            }
//
////                    if let schedules = resourceScheduleFromTo.schedules {
////                    for schedule in schedules {
////                        print(schedules)
////                        worker?.getResourcebookingId(schedule)
//
//
//
////                        }
////                    }
////                }
////                    resourceSchedulesArray = items
////                let response = TeamplannerTab.Something.Response(
////                    resourceSchedules: resourceSchedulesArray
////                    ,error: error
////                    )
////                self.presenter?.presentSomething(response: response)
//                }, onFailure: { error in
//                            print(error)
////                    let response = TeamplannerTab.Something.Response(
////                        resourceSchedules: resourceSchedulesArray
////                        ,error: error.localizedDescription
////                    )
////                    self.presenter?.presentSomething(response: response)
//                })
//    }
//
    }
}
