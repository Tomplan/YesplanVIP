////
////  ApiReachabilityManager.swift
////  YesplanVIP
////
////  Created by Tom Slegers on 13/02/2020.
////  Copyright © 2020 Yesplan. All rights reserved.
////
//
//import Foundation
//import CoreTelephony
//import Alamofire
//
//class ApiReachabilityManager {
//  static let shared = ApiReachabilityManager()
//  
//  private let networkReachabilityManager = NetworkReachabilityManager()
//  private let cellularData = CTCellularData()
//  
//  private var currentNetworkReachabilityState: NetworkReachabilityManager.NetworkReachabilityStatus = .unknown
//  private var currentCellularDataState: CTCellularDataRestrictedState = .restrictedStateUnknown
//  
//  func start() {
//    cellularData.cellularDataRestrictionDidUpdateNotifier = { [weak self] (state) in
//      self?.currentCellularDataState = state
//    }
//    
//    networkReachabilityManager?.startListening { [weak self] state in
//      self?.currentNetworkReachabilityState = state
//    }
//    
////    networkReachabilityManager?.startListening()
//  }
//  
//  func checkApiReachability(viewController: UIViewController?, completion: (_ restricted: Bool) -> Void) {
//    let isRestricted = currentNetworkReachabilityState == .notReachable && currentCellularDataState == .restricted
//    
//    guard !isRestricted else {
//      if let viewController = viewController {
//        presentReachabilityAlert(on: viewController)
//      }
//      completion(true)
//      return
//    }
//    
//    completion(false)
//  }
//  
//  private func presentReachabilityAlert(on viewController: UIViewController) {
//    let alertController = UIAlertController(
//      // TODO: replace YOUR-APP by your app's name
//      title: "Mobile Data is Turned Off for \"YOUR-APP\"",
//      message: "You can turn on mobile data for this app in Settings.",
//      preferredStyle: .alert
//    )
//    if let settingsUrl = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(settingsUrl) {
//      alertController.addAction(
//        UIAlertAction(title: "Settings", style: .default, handler: { action in
//            UIApplication.shared.open(settingsUrl)
//        })
//      )
//    }
//    
//    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//    alertController.addAction(okAction)
//    alertController.preferredAction = okAction
//    
//    viewController.present(alertController, animated: true, completion: nil)
//  }
//}
