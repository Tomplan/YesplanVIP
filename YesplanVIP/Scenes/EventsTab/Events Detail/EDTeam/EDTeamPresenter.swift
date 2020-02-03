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

    // MARK: Do something
    
    func presentSomething(response: EDTeam.Something.Response)
    {
        for dict in response.dictionary {
            var header: String = String()
            if let x = dict.key {
            header = x
            }
            var rows: [EDTeam.Something.ViewModel.Section.Row] = []
//            print("dict:", dict)
            let x = dict.value.filter { $0.type == "Human" }
//            print("x:", x)
            for i in 0 ..< x.count {
                let resourcebooking = x[i]
//                print("res:", resourcebooking)
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
                            case .instantiableResourceUseGroup(_):
                                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
                                rows.append(row)
                            case .resourceSetUse(_):
                                let row = EDTeam.Something.ViewModel.Section.Row(resourcebooking: resourcebooking)
                                rows.append(row)

                            }
            }
                let section = EDTeam.Something.ViewModel.Section(
                    header: header
                    ,rows: rows
                )
            if rows.isEmpty == false {
                sections.append(section)
                }
            }
            let viewModel = EDTeam.Something.ViewModel(sections: sections)
            viewController?.displaySomething(viewModel: viewModel)
//        print("viewmodel:", viewModel)
    }
}
