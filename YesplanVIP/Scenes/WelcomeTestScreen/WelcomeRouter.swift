//
//  WelcomeRouter.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 8/09/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.

import UIKit

public protocol WelcomeRoutingLogic {
  func routeToSomewhere()
}

public protocol WelcomeDataPassing {
  var dataStore: WelcomeDataStore? { get }
}

public class WelcomeRouter: WelcomeRoutingLogic, WelcomeDataPassing {
  weak var viewController: WelcomeViewController?
  public var dataStore: WelcomeDataStore?

  // MARK: - Routing

  public func routeToSomewhere() {
    // let destinationVC = SomewhereViewController()
    // let destinationDS = destinationVC.router!.dataStore!

    // passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    // navigateToSomewhere(source: viewController!, destination: destinationVC)
  }

  // MARK: - Navigation

  // func navigateToSomewhere(source: WelcomeViewController, destination: SomewhereViewController) {
  //   source.show(destination, sender: nil)
  // }

  // MARK: - Passing data

  // func passDataToSomewhere(source: WelcomeDataStore, destination: inout SomewhereDataStore) {
  //   destination.name = source.name
  // }
}
