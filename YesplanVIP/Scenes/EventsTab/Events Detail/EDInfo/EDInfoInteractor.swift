//
//  EDInfoInteractor.swift
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
import PromiseKit

protocol EDInfoBusinessLogic
{
  func doSomething(request: EDInfo.Something.Request)
}

protocol EDInfoDataStore
{
  var id: String! { get set }
}

class EDInfoInteractor: EDInfoBusinessLogic, EDInfoDataStore
{
  var presenter: EDInfoPresentationLogic?
  var worker: EDInfoWorker?
    var id: String!

  // MARK: Do something
  
  func doSomething(request: EDInfo.Something.Request)
  {
    worker = EDInfoWorker()
    worker?.getEvent(id)
    .done
        { event in
                let response = EDInfo.Something.Response(event: event)
                self.presenter?.presentSomething(response: response)
                
            }
  .catch { error in
    print("error")
    }
}
}
