//
//  EventsTabModels.swift
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

enum EventsTab
{
  // MARK: Use cases
  
  enum Something
  {
    
    struct Request
    {
    }
    
    struct Response
    {
        let events: [Event]
    }
    
    struct ViewModel
    {
        struct DisplayedEvent {
            let date: String
            let event: [Event]
        }
        
        var displayedEvents: [DisplayedEvent]
    }
//
    
  }
}
