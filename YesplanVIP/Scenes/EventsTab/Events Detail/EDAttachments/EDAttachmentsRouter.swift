//
//  EDAttachmentsRouter.swift
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

@objc protocol EDAttachmentsRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol EDAttachmentsDataPassing
{
    var dataStore: EDAttachmentsDataStore? { get }
}

class EDAttachmentsRouter: NSObject, EDAttachmentsRoutingLogic, EDAttachmentsDataPassing
{
    weak var viewController: EDAttachmentsViewController?
    var dataStore: EDAttachmentsDataStore?
    
    // MARK: Routing
    
//    func routeToSomewhere(segue: UIStoryboardSegue?)
//    {
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
    
    //func navigateToSomewhere(source: EDAttachmentsViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: EDAttachmentsDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
