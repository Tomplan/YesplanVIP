//
//  ToDoRouter.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ToDosRoutingLogic
{
  func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ToDosDataPassing
{
  var dataStore: ToDosDataStore? { get }
}

class ToDosRouter: NSObject, ToDosRoutingLogic, ToDosDataPassing
{
  weak var viewController: ToDosViewController?
  var dataStore: ToDosDataStore?
  
  // MARK: Routing
  
  func routeToSomewhere(segue: UIStoryboardSegue?)
  {
      let destinationVC = ToDosDetailViewController()
      var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
    
  }
  // MARK: Navigation
  func navigateToSomewhere(source: ToDosViewController, destination: ToDosDetailViewController)
  {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  func passDataToSomewhere(source: ToDosDataStore, destination: inout ToDosDetailDataStore)
  {
    let selectedItem = viewController?.v.collectionView.indexPathsForSelectedItems
    let section = selectedItem![0][0]
    let item = selectedItem![0][1]

    if let id = source.toDosDS?[section].value[item].id {
    destination.id = id
    }

  }
}
