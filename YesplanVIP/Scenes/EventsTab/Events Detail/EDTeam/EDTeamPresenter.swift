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
    var resourcebookings = [Resourcebooking]()
    // MARK: Do something
    
    func presentSomething(response: EDTeam.Something.Response)
    {
                print("present: ", response.name)
        for resourcebooking in response.resourcebookings {
//            where resourcebooking.type == "Human" {
            print("*: ", resourcebooking)
//            switch resourcebooking {
//            case .bulkResourceUse(let x): print("bulkResourceUse: ", x)
//            case .freeFormResourceUse(let x): print("freeFormResourceUse: ", x)
//            case .instantiableResourceUse(let x): print("instantiableResourceUse: ", x)
//            case .instantiableResourceUseGroup(let x): print("instantiableResourceUseGroup: ")
//            for child in x.children { print("child: ", child.resource?.name as Any) }
//            case .resourceSetUse(let x): print("resourceSetUse: ")
//                 for child in x.children { print("child: ")
//                    switch child {
//                    case .bulkResourceUse(let x): print("bulkResourceUse: ", x)
//                    case .freeFormResourceUse(let x): print("freeFormResourceUse: ", x)
//                    case .instantiableResourceUseGroup(let x): print("instantiableResourceUseGroup: ")
//                    for child in x.children { print("child: ", child.resource?.name as Any) }
//                    case .resourceSetUse(let x): print("child: ", x)
//                    }
//                }
//            }
        }
//            let name = response.name
//            let rows = response.resourcebookings
//            let sections = EDTeam.Something.ViewModel(sections: [
//                EDTeam.Something.ViewModel.Item(header: name, rows: nil)
//                ,EDTeam.Something.ViewModel.Item(header: "Team", rows: rows)
//                ])
//            let viewModel = sections
//            viewController?.displaySomething(viewModel: viewModel)
    }
}