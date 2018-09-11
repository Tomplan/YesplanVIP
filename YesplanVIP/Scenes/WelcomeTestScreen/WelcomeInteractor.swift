//
//  WelcomeInteractor.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 8/09/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.

import UIKit

public protocol WelcomeBusinessLogic {
  func doSomething(request: Welcome.Something.Request)
}

public protocol WelcomeDataStore {
  //var name: String { get set }
}

public class WelcomeInteractor: WelcomeBusinessLogic, WelcomeDataStore {
  public var presenter: WelcomePresentationLogic?
  public var worker = WelcomeWorker()
  //var name: String = ""

  public func doSomething(request: Welcome.Something.Request) {
    let response = Welcome.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
