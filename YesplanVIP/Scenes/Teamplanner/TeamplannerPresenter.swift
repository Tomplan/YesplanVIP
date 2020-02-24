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
//import PromisedFuture

protocol TeamplannerTabPresentationLogic
{
  func presentSomething(response: TeamplannerTab.Something.Response)
}

class TeamplannerTabPresenter: TeamplannerTabPresentationLogic
{
  weak var viewController: TeamplannerTabDisplayLogic?
    
//    var section: TeamplannerTab.Something.ViewModel.Section
    var sections : [TeamplannerTab.Something.ViewModel.Section] = []
    var sectionsDays : [TeamplannerTab.Something.ViewModel.Section] = []

    // MARK: Do something
    
  func presentSomething(response: TeamplannerTab.Something.Response)
  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let calendar = Calendar.current
        //    calendar.timeZone = .autoupdatingCurrent

        let dayOfWeek = calendar.component(.weekday, from: response.startdate) - 1
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: response.startdate)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: response.startdate) }

//        print(days)
//
//
    sectionsDays = []
    sections = []
//    print("1: ", sections)
    
//  *************************************************************************************
    // Make empty Week Teamplanner
    
    for i in days {
        let header = "\(formatter.string(from: i))"
        let emptyRow = TeamplannerTab.Something.ViewModel.Section.Row()
        let rows: [TeamplannerTab.Something.ViewModel.Section.Row] = [emptyRow]
        let item = TeamplannerTab.Something.ViewModel.Section(header: header, rows: rows)

        if sectionsDays.contains(where: { $0.header == header }) == false {
        sectionsDays.append(item) }
    }
//    print("2: ", sections)
//  *************************************************************************************

//  *************************************************************************************
    // Fill the empty Week of the Teamplanner
//    for section in sections {
        let schedules = response.schedules.flatMap { $0.flatMap { $0.value } }
            for i in 0 ..< schedules.count {
                var rows: [TeamplannerTab.Something.ViewModel.Section.Row] = []
                let header = schedules[i].start.convertDateString(dateFormat: "yyyy-MM-dd")!
                for i in 0 ..< schedules.count where
                    schedules[i].start.convertDateString(dateFormat: "yyyy-MM-dd")! == header {
                    var row = TeamplannerTab.Something.ViewModel.Section.Row(schedules: nil, resourcebooking: nil)
                    let schedule = schedules[i]
                        switch schedule {
                        case .shift( _):
                            row = TeamplannerTab.Something.ViewModel.Section.Row(schedules: schedule, resourcebooking: nil)
                        case .scheduleBreak( _):
                            row = TeamplannerTab.Something.ViewModel.Section.Row(schedules: schedule, resourcebooking: nil)
                        case .lock( _):
                            row = TeamplannerTab.Something.ViewModel.Section.Row(schedules: schedule, resourcebooking: nil)
                        case .schedule(let x):
                            guard let id = x.resourcebooking.id else { return }
                                guard let bookings = response.resourcebookings else { return }
                            let booking = bookings.first(where: {$0.id == id})
                            row = TeamplannerTab.Something.ViewModel.Section.Row(schedules: nil, resourcebooking: booking)
                                }
                        rows.append(row)
                    }
//                for section in sections {
//                    print("section :", section)
//                    print("sectionRow: ", section.rows )
//                    print("row: ", rows)
//
//                }
//                for section in sections where section.header == header {
//                    print("section :", section)
////                    section.rows.append(rows)
//                }
            if rows.isEmpty == false {
                
                let item = TeamplannerTab.Something.ViewModel.Section(header: header, rows: rows)
                if sections.contains(where: { $0.header == header }) == false {
                            sections.append(item) }
            }
        }
    
//        print("sections: ", sections)
    
   
    for section in sections {
        let header = section.header
        
        if let index = sectionsDays.firstIndex(where: {$0.header == header}) {
            sectionsDays[index].rows = section.rows
        }
    }
    
    
//        for i in days {
//            let header = "\(formatter.string(from: i))"
//            var rows: [TeamplannerTab.Something.ViewModel.Section.Row] = []
//            var item = TeamplannerTab.Something.ViewModel.Section(header: header, rows: rows)
//
//            if sections.contains(where: { $0.header == header }) == false {
////            sections.append(item)
//                print()
//            }
//        }
//    }
  
//        print("sectionDays: ", sectionsDays)
        let viewModel = TeamplannerTab.Something.ViewModel(
            sections: sectionsDays
            ,error: nil )
        self.viewController?.displaySomething(viewModel: viewModel)
    }
}

//    print(response.resourcebookings)
//    for stringSchedule in response.stringSchedules {
//        if stringSchedule.value.count == 0 {
//        } else
//        {
//            var partrows: [TeamplannerTab.Something.ViewModel.Section.Row] = []
//            for i in 0 ..< stringSchedule.value.count {
//                var partrow = TeamplannerTab.Something.ViewModel.Section.Row(schedules: nil, resourcebooking: nil)
//                let partrowItem = stringSchedule.value[i]
//                switch partrowItem {
//                case .shift(_):
//                    partrow = TeamplannerTab.Something.ViewModel.Section.Row(schedules: partrowItem, resourcebooking: nil)
////                    partrows.append(partrow)
//
//                case .lock(_):
//                    partrow = TeamplannerTab.Something.ViewModel.Section.Row(schedules: partrowItem, resourcebooking: nil)
////                    partrows.append(partrow)
//                case .scheduleBreak(_):
//                    partrow = TeamplannerTab.Something.ViewModel.Section.Row(schedules: partrowItem, resourcebooking: nil)
////                    partrows.append(partrow)
//                case .schedule(let x):
////                    print(x)
//                        if let id = x.resourcebooking.id {
////                            print(id)
//                            if let bookings = response.resourcebookings {
//
//                                let booking = bookings.first(where: {$0.id! == id})
////                                print(booking)
////                                print(bookings.first(where: { (res) -> Bool in
////                                    print("res: ", res)
////                                    return true
////                                }))
//                                if booking != nil {
////                                    print(booking)
//                                partrow = TeamplannerTab.Something.ViewModel.Section.Row(schedules: nil, resourcebooking: booking)
////                                partrows.append(partrow)
//                                }
//                            }
//                        }
////                        partrow = TeamplannerTab.Something.ViewModel.Section.Row(schedules: partrowItem, resourcebooking: nil)
////                        partrows.append(partrow)
//                }
//                if partrow.schedules != nil || partrow.resourcebooking != nil {
////                print(partrow)
//                partrows.append(partrow)
//                }
//            }
//
//            for i in 0 ..< stringSchedule.value.count {
//                var rows: [TeamplannerTab.Something.ViewModel.Section.Row] =  []
//                let header = stringSchedule.value[i].start.convertDateString(dateFormat: "yyyy-MM-dd")!
//                    for i in 0 ..< stringSchedule.value.count
//                        where stringSchedule.value[i].start.convertDateString(dateFormat: "yyyy-MM-dd")! == header {
//                        let schedule = stringSchedule.value[i]
//                        switch schedule {
//                        case .schedule(let x):
//                            if let id = x.resourcebooking.id {
//                                if let bookings = response.resourcebookings {
//                                    let booking = bookings.first(where: {$0.id! == id})
//                                    if booking != nil {
//                                       let row = TeamplannerTab.Something.ViewModel.Section.Row(schedules: nil, resourcebooking: booking)
//                                        rows.append(row)
//                                        }
//                                    }
//                                }
//                        default:
//                            let row = TeamplannerTab.Something.ViewModel.Section.Row(schedules: schedule, resourcebooking: nil)
//                            rows.append(row)
//                       }
//                }
//                if rows.isEmpty == false {
//                    let item = TeamplannerTab.Something.ViewModel.Section(header: header, rows: rows)
//                    if DateAndSchedulesArray.contains(where: { $0.header == header }) == false {
//                        DateAndSchedulesArray.append(item) }
//                }
//            }
//            let viewModel = TeamplannerTab.Something.ViewModel(
//                    sections: DateAndSchedulesArray
//                    ,error: nil
//                    )
//            self.viewController?.displaySomething(viewModel: viewModel)
//            }
//        }
//    }
//}

////    ************************************************** oldway
//    for resourceSchedule in response.resourceSchedules {
//    for resourceSchedule in response.stringSchedules {
//
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
//    }
//}
//
//
//}
