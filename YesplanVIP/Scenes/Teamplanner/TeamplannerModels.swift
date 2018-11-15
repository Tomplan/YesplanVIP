//
//  TeamplannerModels.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 13/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import PromisedFuture

enum TeamplannerTab
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        var stringSchedules: [String?: [Schedules]]
        var error: String?
        
//        struct Sections: Codable {
//            let header: String?
//            let rows: [Row]
//
//            struct Row: Codable {
//                let schedules: Schedules?
//                let resourcebooking: Schedules? // Resourcebooking?
//            }
//        }
        
//        var resourcebookings: [Resourcebooking]
    }
    struct ViewModel
    {
        var sections: [Section]
        var error: String?
        
        struct Section: Codable {
            let header: String?
            let rows: [Row]

            struct Row: Codable {
                let schedules: Schedules?
                let resourcebooking: Schedules? // Resourcebooking?
            }
        }
//
//        struct Displ: Hashable {
//
//            let date: String
//            let scheduleType: String
//            let start: String
//            let end: String
//            let eventName: String?
//        }

//        var sections: Set<Item>
    }
  }
}
