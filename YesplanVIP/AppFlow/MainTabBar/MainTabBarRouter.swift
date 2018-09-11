//
//  MainTabBarRouter.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 5/09/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol MainTabBarRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol MainTabBarDataPassing
{
  var dataStore: MainTabBarDataStore? { get }
}

class MainTabBarRouter: NSObject, MainTabBarRoutingLogic, MainTabBarDataPassing
{
  weak var viewController: MainTabBarViewController?
  var dataStore: MainTabBarDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: MainTabBarViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: MainTabBarDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
