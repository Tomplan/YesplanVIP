//
//  LoginInteractor.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 14/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic
{
  func loginPressed(request: Login.EnterLogin.Request)
}

protocol LoginDataStore
{
  //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
  var presenter: LoginPresentationLogic?
  var worker: LoginWorker?
  //var name: String = ""
  
  // MARK: Do something
  
    func loginPressed(request: Login.EnterLogin.Request) {
      
    worker = LoginWorker()
    worker?.doSomeWork()
        
        let companyUrl = request.companyURL 
        let apiKey = request.apiKey
        
        // insert Alamofirerequest
        
        if companyUrl != "" && apiKey != "" {
    let response = Login.EnterLogin.Response(success: true)
    presenter?.presentSomething(response: response)
        }
        else {
            let response = Login.EnterLogin.Response(success: false)
            print("please fill")
            presenter?.presentSomething(response: response)
        }
  }
}