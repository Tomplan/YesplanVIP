//
//  WelcomePresenter.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 8/09/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.

import UIKit

public protocol WelcomePresentationLogic {
  func presentSomething(response: Welcome.Something.Response)
}

public class WelcomePresenter: WelcomePresentationLogic {
  weak var viewController: WelcomeDisplayLogic?

  public func presentSomething(response: Welcome.Something.Response) {
    let viewModel = Welcome.Something.ViewModel()

    viewController?.displaySomething(viewModel: viewModel)
  }
}
