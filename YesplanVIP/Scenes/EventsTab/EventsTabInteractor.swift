//
//  EventsTabInteractor.swift
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
import PromiseKit

protocol EventsTabBusinessLogic
{
  func doSomething(request: EventsTab.Something.Request)
}

protocol EventsTabDataStore
{
    var eventsDS: [(key: String, value: [Event])]? { get set }
}

class EventsTabInteractor: EventsTabBusinessLogic, EventsTabDataStore
{
  var presenter: EventsTabPresentationLogic?
  var worker: EventsTabWorker?
    
    var eventsArray: [(key: String, value: [Event])] = [(key: String, value: [Event])]()
    var statusesArray: [Status] = [Status]()
    var profilesArray: [Profile] = [Profile]()
    var error: String?
    var eventsDS: [(key: String, value: [Event])]?
//    var event: String?
    
  // MARK: Do something

  func doSomething(request: EventsTab.Something.Request) // -> Promise<EventsTab.Something.Response>
  {
    worker = EventsTabWorker()
    worker?.getProfiles()
        .execute(onSuccess: { items in
            self.profilesArray = items.data
        }, onFailure: { error in
            print(error) }
        )
    
    worker?.getStatuses()
        .execute(onSuccess: { items in
            self.statusesArray = items.data
        }, onFailure: { error in
            print(error) }
    )
    
    worker?.getEvents("event:date:#today + event:date:#next13days")
        .andThen((worker?.groupEventsByStartdate)!)
        .andThen((worker?.sortEventsInEachGroupByTime)!)
        .andThen((worker?.sortDictByDate)!)
        .execute(onSuccess: { items in
            self.eventsDS = items
                self.eventsArray = items
                let response = EventsTab.Something.Response(
                    events: self.eventsArray,
                    statuses: self.statusesArray,
                    profiles: self.profilesArray,
                    error: self.error
                    )
                self.presenter?.presentEvents(response: response)
            }) { error in
//                print(error)
                self.error = error.localizedDescription
                let response = EventsTab.Something.Response(
                    events: self.eventsArray,
                    statuses: self.statusesArray,
                    profiles: self.profilesArray,
                    error: self.error
                    )
                self.presenter?.presentEvents(response: response)
                
            }

////                print("pagination: ", self.fetchedEvents.pagination )
////                self.yesplan.getMore(self.fetchedEvents, paginationNext: self.fetchedEvents.pagination.next!).then { more in
////                    print("more", more.pagination)
//                }
  }
}
