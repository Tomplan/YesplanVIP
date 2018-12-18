//
//  EDTeamPresenter.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol EDTeamPresentationLogic
{
    func presentSomething(response: EDTeam.Something.Response)
}

class EDTeamPresenter: EDTeamPresentationLogic
{
    weak var viewController: EDTeamDisplayLogic?
    var sections : [EDTeam.Something.ViewModel.Section] = []

    var resourcebookings: [Resourcebooking] = []
    // MARK: Do something
    
    func presentSomething(response: EDTeam.Something.Response)
    {
        for dict in response.dictionary {
            var header: String = String()
            if let x = dict.key {
            header = x
            }
            print(header)
            
            var resourcebookings: [Resourcebooking] = []
            let x = dict.value
            
            for i in 0 ..< x.count {
                let resourcebooking = x[i]
                var rows: [EDTeam.Something.ViewModel.Section.Row] = []
                            switch resourcebooking {
                            case .bulkResourceUse(_):
                                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
                
                                rows.append(row)
                            case .freeFormResourceUse(_):
                                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
                                rows.append(row)
                            case .instantiableResourceUse(_):
                                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
                                rows.append(row)
                            case .instantiableResourceUseGroup(let x):
//                                for child in x.children {
//                                    let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: child)
//                                    rows.append(row)
//                                }
                                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
                                rows.append(row)
                            case .resourceSetUse(let x):
//                                for child in x.children {
//                                    let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: child)
////                                    let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
//                                    rows.append(row)
//                                }
                                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
                                rows.append(row)

                            }
                
                            let section = EDTeam.Something.ViewModel.Section(
                                header: header
                                ,rows: rows
                            )
                            //            let section = EDTeam.Something.ViewModel.Section(header: header, rows: rows)
                            //            if sections.contains(where: { $0.header == header }) == false {
                            //                sections.append(section) }
                            sections.append(section)
                        }
                        let viewModel = EDTeam.Something.ViewModel(sections: sections)
//            print("viewModel:", viewModel)
                        viewController?.displaySomething(viewModel: viewModel)

        }
        
//            for j in 0 ..< response.dictionary.values.count
//            {
//
//            let resourcebooking = response.dictionary.values[j]
//            var rows: [EDTeam.Something.ViewModel.Section.Row] = []
//            switch resourcebooking {
//            case .bulkResourceUse(_):
//                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
//
//                rows.append(row)
//            case .freeFormResourceUse(_):
//                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
//                rows.append(row)
//            case .instantiableResourceUse(_):
//                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
//                rows.append(row)
//            case .instantiableResourceUseGroup(let x):
//                for child in x.children {
//                    let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: child)
//                    rows.append(row)
//                }
//            case .resourceSetUse(let x):
//                for child in x.children {
//                    let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: child)
//                    rows.append(row)
//                }
//            }
//
//            let section = EDTeam.Something.ViewModel.Section(
//                header: header
//                ,rows: rows
//            )
//            //            let section = EDTeam.Something.ViewModel.Section(header: header, rows: rows)
//            //            if sections.contains(where: { $0.header == header }) == false {
//            //                sections.append(section) }
//            sections.append(section)
//        }
//        let viewModel = EDTeam.Something.ViewModel(sections: sections)
//        viewController?.d
        
        
        
        
//        for i in 0 ..< response.resourcebookings.count {
//            let resourcebooking = response.resourcebookings[i]
//            let header = resourcebooking.resource.group!
//            var rows: [EDTeam.Something.ViewModel.Section.Row] = []
//            switch resourcebooking {
//            case .bulkResourceUse(_):
//                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
//
//                rows.append(row)
//            case .freeFormResourceUse(_):
//                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
//                rows.append(row)
//            case .instantiableResourceUse(_):
//                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
//                rows.append(row)
//            case .instantiableResourceUseGroup(let x):
//                for child in x.children {
//                    let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: child)
//                    rows.append(row)
//                }
//            case .resourceSetUse(let x):
//                for child in x.children {
//                    let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: child)
//                    rows.append(row)
//                }
//            }
//
//            let section = EDTeam.Something.ViewModel.Section(
//                header: header
//                ,rows: rows
//            )
////            let section = EDTeam.Something.ViewModel.Section(header: header, rows: rows)
////            if sections.contains(where: { $0.header == header }) == false {
////                sections.append(section) }
//            sections.append(section)
//        }
//        let viewModel = EDTeam.Something.ViewModel(sections: sections)
//        viewController?.displaySomething(viewModel: viewModel)

//
//
////                print("response: ", response.dict)
//
////        let bookingIds = response.dict.flatMap { $0.flatMap { $0.value } }
////                    print("bookings:", bookingIds)
//        let headers = response.dict.flatMap { $0.map { $0.key } }
////                    print(headers)
////        let bookings = response.resourcebookings
////        print(bookings)
//
//        for i in 0 ..< response.dict.count {
//
//            var header: String = ""
//            var rows: [EDTeam.Something.ViewModel.Section.Row] = []
//
//            for bookingIds in response.dict[i].values {
////                print(bookingIds)
//                header = headers[i]
//
//                for bookingId in bookingIds {
////                    print("bookingId:", bookingId)
//                    let booking = response.resourcebookings.first(where: {$0.id == bookingId})
////                        print(booking?.resource.type)
//                        if booking?.resource.type == "Human" {
//    //                        print(booking?.resource.name)
//                            let row = EDTeam.Something.ViewModel.Section.Row(
//                                resourcebooking: booking!)
//                        rows.append(row)
//                        }
//                }
//
//                if rows.isEmpty != true {
//                let section = EDTeam.Something.ViewModel.Section(
//                    header : header,
//                    rows: rows)
////                    print(rows)
//                sections.append(section)
//                }
//            }
//        }
//        let viewModel = EDTeam.Something.ViewModel(
//            sections: sections
//        )
////        print(viewModel)
//        self.viewController?.displaySomething(viewModel: viewModel)
//
////            where response.resourcebookings[i].resource.type == "Human" {
////            print("*: ", response.resourcebookings[i].resource.name)
////
////        }
////            let name = response.name
////            let rows = response.resourcebookings
////            let sections = EDTeam.Something.ViewModel(sections: [
////                EDTeam.Something.ViewModel.Item(header: name, rows: nil)
////                ,EDTeam.Something.ViewModel.Item(header: "Team", rows: rows)
////                ])
////            let viewModel = sections
////            viewController?.displaySomething(viewModel: viewModel)
    }
}
