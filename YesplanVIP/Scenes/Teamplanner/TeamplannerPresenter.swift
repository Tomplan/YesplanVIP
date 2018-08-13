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

protocol TeamplannerPresentationLogic
{
  func presentSomething(response: Teamplanner.Something.Response)
}

class TeamplannerPresenter: TeamplannerPresentationLogic
{
  weak var viewController: TeamplannerDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Teamplanner.Something.Response)
  {
    let viewModel = Teamplanner.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
