//
//  Event.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
//import Arrow
//import then

struct Event: Codable {
    
    var url = URL(string: "http://")!
    var id: String = ""
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var name: String?
    var group: Base? // NOT Group_Id, locations... is not transferred by Yesplan in Event_Id !?!
    var starttime: String? // timestamp Date and time of the start of the event.
    var endtime: String? // timestamp Date and time of the end of the event.
    var startdate: String? // date Date on which the start of the event appears in the calendar.
    var enddate: String? // date Date on which the end of the event appears in the calendar.
    var profile: Base? // NOT Profile_Id, color is not transferred by Yesplan in Event_Id !?!
    var status: Base? // NOT Status_Id, backgroundcolor, textcolor and statustype are not transferred by Yesplan in Event_Id !?!
    var locations: [Base]? // NOT Location_Id // optional added by TOM, important for Children!!!!
    var production: Base? // null or Event_Id or Group_Id
    var isproduction: Bool = false
    var attributes: Pagination?
    var _type: EventType
    var labels: [String]?
    var defaultscheduledescription: String?
    var defaultschedulestarttime: String? // time
    var defaultscheduleendtime: String?  // time
    var defaultschedulestart: String? // timestamp
    var defaultscheduleend: String? // timestamp
    
}

enum EventType: String, Codable {
    case event
}
