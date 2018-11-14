//
//  TeamplannerPresenter.swift
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

protocol TeamplannerTabPresentationLogic
{
  func presentSomething(response: TeamplannerTab.Something.Response)
}

class TeamplannerTabPresenter: TeamplannerTabPresentationLogic
{
    
    
  weak var viewController: TeamplannerTabDisplayLogic?
    
//    var error: String?
//    var resourcebookingDispls: Set<TeamplannerTab.Something.ViewModel.Displ> = []
//    var resourcebookings: Set<TeamplannerTab.Something.ViewModel.DisplayedResourcebooking> = []
//    var dictResourcebookings: [String:[TeamplannerTab.Something.ViewModel.Displ]] = [:]
    
    var DateAndSchedulesArray = [TeamplannerTab.Something.ViewModel.Item]()
    // MARK: Do something
    
  func presentSomething(response: TeamplannerTab.Something.Response)
  {
//    var error: String?
//    var resourcebookingDispls: Set<TeamplannerTab.Something.ViewModel.Displ> = []
//    var resourcebookings: Set<TeamplannerTab.Something.ViewModel.Item> = []
//    var dictResourcebookings: [String:[TeamplannerTab.Something.ViewModel.Displ]] = [:]
    for stringSchedule in response.stringSchedules {
//        print("schedule ***** " , schedule)
        if stringSchedule.value.count == 0 {
            print("nul")
        } else
        {
            for i in 0 ..< stringSchedule.value.count {
                var rows = [Schedules]()
                let header = stringSchedule.value[i].start.convertDateString(dateFormat: "yyyy-MM-dd")!
                let row = stringSchedule.value[i]
                    for i in 0 ..< stringSchedule.value.count where stringSchedule.value[i].start.convertDateString(dateFormat: "yyyy-MM-dd")! == header {
//                        let row = stringSchedule.value[i]
                        rows.append(row)
                    }
                let item = TeamplannerTab.Something.ViewModel.Item(header: header, rows: rows)
                print(item)
                if DateAndSchedulesArray.contains(where: { $0.header == header }) == false {
                    DateAndSchedulesArray.append(item) }
            }
            
//            print(DateAndSchedulesArray)
            
            
//            print("sectionsNotGrouped: ", sectionsNotGrouped)
//            let sectionsGrouped = Dictionary(grouping: DateAndSchedulesArray, by: { $0.header })
//            print(sectionsGrouped)
//            let sections = DateAndSchedulesArray.sorted(by: $0.header)
//                        print(sections
            let viewModel = TeamplannerTab.Something.ViewModel(
                    sections: DateAndSchedulesArray
                    ,error: nil
                    )
            self.viewController?.displaySomething(viewModel: viewModel)
//            var dictionary = [String:Schedules]()
//            schedule.value.forEach {
//                dictionary[$0.start.convertDateString(dateFormat: "yyyy-MM-dd")!] = $0
//            }
//            dump(dictionary)
          
//            for (key, value) in dictionary {
////                let valueSorted = value.sorted{ $0.start <  $1.start }
//                items[key] = value
//            }
//            print(items)
//        var rows = [Schedules]()
//        for i in 0 ..< schedule.value.count {
//            print("schedule $$ ", schedule.value[i])
//        let header = schedule.value[i].start.convertDateString(dateFormat: "yyyy-MM-dd")!
//
//        let rows = schedule.value[i]
//
////        let item = TeamplannerTab.Something.ViewModel.Item(header: header, rows: rows)
////        sections.append(item)
//        }
        }
    }
////    print("sections: ", sections)
//    let viewModel = TeamplannerTab.Something.ViewModel(sections: sections, error: nil)
//    self.viewController?.displaySomething(viewModel: viewModel)

//    for resourceSchedule in response.resourceSchedules {
//        if let schedules = resourceSchedule.schedules {
//        for schedule in schedules {
//            schedule.eventName.execute(onSuccess: { result in
//                var item: TeamplannerTab.Something.ViewModel.Displ = TeamplannerTab.Something.ViewModel.Displ(
//                    date: schedule.date
//                    , scheduleType: schedule.scheduletype
//                    , start: schedule.start
//                    , end: schedule.end
//                    , eventName: ""
//                )
//                if let name = result {
//                    item = TeamplannerTab.Something.ViewModel.Displ(
//                    date: schedule.date
//                    , scheduleType: schedule.scheduletype
//                    , start: schedule.start
//                    , end: schedule.end
//                    , eventName: name
//                    )
//                } else {
//                    item = TeamplannerTab.Something.ViewModel.Displ(
//                    date: schedule.date
//                    , scheduleType: schedule.scheduletype
//                    , start: schedule.start
//                    , end: schedule.end
//                    , eventName: nil
//                    )
//                }
//                resourcebookingDispls.insert(item)
//                dictResourcebookings = Dictionary(grouping: resourcebookingDispls, by: { $0.date })
//                var items: [String:[TeamplannerTab.Something.ViewModel.Displ]] = [:]
//                for (key, value) in dictResourcebookings {
//                    let valueSorted = value.sorted{ $0.start <  $1.start }
//                    items[key] = valueSorted
//                }
//                resourcebookings = []
//                for (key, value) in items {
//                    resourcebookings.insert(TeamplannerTab.Something.ViewModel.DisplayedResourcebooking(date: key, resourcebookings: value))
//                }
//                let viewModel = TeamplannerTab.Something.ViewModel(
//                    displayedResourcebookings: resourcebookings
//                    ,error: error
//                    )
//                self.viewController?.displaySomething(viewModel: viewModel)
//                })
//            }
//        }}
    }
}

