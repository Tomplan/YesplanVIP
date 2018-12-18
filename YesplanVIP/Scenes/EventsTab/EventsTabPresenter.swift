//
//  EventsTabPresenter.swift
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

protocol EventsTabPresentationLogic
{
  func presentEvents(response: EventsTab.Something.Response)
}

class EventsTabPresenter: EventsTabPresentationLogic
{
  weak var viewController: EventsTabDisplayLogic?

  // MARK: Do something
  
  func presentEvents(response: EventsTab.Something.Response)
  {
    var events: [EventsTab.Something.ViewModel.DisplayedEvent] = []
    var profilesDict: [String:String] = [:]
    var statusesDict: [String:String] = [:]

    if response.events.isEmpty { let viewModel = EventsTab.Something.ViewModel(
        displayedEvents: events,
        displayedStatuses: statusesDict,
        displayedProfiles: profilesDict,
        error: response.error
        )
        viewController?.displaySomething(viewModel: viewModel)
    }
    else {
    for (key, value) in response.events {
        events.append(EventsTab.Something.ViewModel.DisplayedEvent(date: key.convertDateStringShort(dateFormat: "EEEE, dd MMMM yyyy")!, events: value))

    }
    
    for profile in response.profiles {
        profilesDict[profile.id] = profile.color
    }
    
    for status in response.statuses {
        if let name = status.name {
        statusesDict[name] = status.backgroundcolor
        }
    }
        
    let viewModel = EventsTab.Something.ViewModel(
        displayedEvents: events,
        displayedStatuses: statusesDict,
        displayedProfiles: profilesDict,
        error: nil
    )
        
    viewController?.displaySomething(viewModel: viewModel)
        
    }
  }
}
