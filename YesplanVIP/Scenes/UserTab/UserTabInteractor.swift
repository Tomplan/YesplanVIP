//
//  UserTabInteractor.swift
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

protocol UserTabBusinessLogic
{
  func doSomething(request: UserTab.Something.Request)
}

protocol UserTabDataStore
{
  //var name: String { get set }
}

class UserTabInteractor: UserTabBusinessLogic, UserTabDataStore
{
  var presenter: UserTabPresentationLogic?
  var worker: UserTabWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: UserTab.Something.Request)
  {
    worker = UserTabWorker()
    worker?.doSomeWork()
    
    let response = UserTab.Something.Response()
    presenter?.presentSomething(response: response)
  }
}