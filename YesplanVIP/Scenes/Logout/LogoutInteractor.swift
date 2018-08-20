//
//  LogoutInteractor.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 20/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LogoutBusinessLogic
{
  func doSomething(request: Logout.Something.Request)
}

protocol LogoutDataStore
{
  //var name: String { get set }
}

class LogoutInteractor: LogoutBusinessLogic, LogoutDataStore
{
  var presenter: LogoutPresentationLogic?
  var worker: LogoutWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Logout.Something.Request)
  {
    worker = LogoutWorker()
    worker?.doSomeWork()
    
    let response = Logout.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
