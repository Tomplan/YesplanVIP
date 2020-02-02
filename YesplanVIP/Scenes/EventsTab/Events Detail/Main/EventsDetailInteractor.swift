//
//  EventsDetailInteractor.swift
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

protocol EventsDetailBusinessLogic
{
  func doSomething(request: EventsDetail.Something.Request)
}

protocol EventsDetailDataStore
{
    var id: String! { get set }
    var name: String! { get set }

}

class EventsDetailInteractor: EventsDetailBusinessLogic, EventsDetailDataStore
{
      var presenter: EventsDetailPresentationLogic?
      var worker: EventsDetailWorker?
      var id: String!
      var name: String!

  // MARK: Do something
  
  func doSomething(request: EventsDetail.Something.Request)
  {
    worker = EventsDetailWorker()
    worker?.getEvent(id)
        .done { result in
            self.name = result.name
            let response = EventsDetail.Something.Response(event: result)
            self.presenter?.presentSomething(response: response)
            }
    .catch { error in
        print("error")
    //          let response = EventsTab.Something.Response(
    //              event: self.,
    //              statuses: self.statusesArray,
    //              profiles: self.profilesArray,
    //              error: error.localizedDescription
    //          )
    //          self.presenter?.presentEvents(response: response)
        }
//    .execute(onSuccess:
//        { event in
//            self.name = event.name
//            let response = EventsDetail.Something.Response(event: event)
//            self.presenter?.presentSomething(response: response)
//        }, onFailure: { error in
//            print(error)
//        })
    }
}
