//
//  TDAttachmentsRouter.swift
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

@objc protocol TDAttachmentsRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol TDAttachmentsDataPassing
{
    var dataStore: TDAttachmentsDataStore? { get }
}

class TDAttachmentsRouter: NSObject, TDAttachmentsRoutingLogic, TDAttachmentsDataPassing
{
    weak var viewController: TDAttachmentsViewController?
    var dataStore: TDAttachmentsDataStore?
    
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
    
    //func navigateToSomewhere(source: TDAttachmentsViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: TDAttachmentsDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}