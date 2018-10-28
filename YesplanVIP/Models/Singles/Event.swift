//
//  Event.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow
import then

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
    var status: Base? // NOT Status_Id, backgroundcolor,textcolor and statustype are not transferred by Yesplan in Event_Id !?!
    var locations: [Base]? // NOT Location_Id // optional added by TOM, important for Children!!!!
    var production: Base? // null or Event_Id or Group_Id
    var isproduction: Bool = false
    var attributes: Pagination?
    var _type = "event"
//    //    var labels: [JSONAny]
    var defaultscheduledescription: String?
    var defaultschedulestarttime: String? // time
    var defaultscheduleendtime: String?  // time
    var defaultschedulestart: String? // timestamp
    var defaultscheduleend: String? // timestamp
    
    init() { guard self._type == "event" else { return } }

}

//extension Event: ArrowParsable {
//    
//    public mutating func deserialize(_ json: JSON) {
//
//        _type <-- json["_type"]
//
//        id <-- json["id"]
//        url <-- json["url"]
//        owner <-- json["owner"]
//        owningteam <-- json["owningteam"]
//        owninggroup <-- json["owninggroup"]
//        name <-- json["name"]
//        group <-- json["group"]
//        starttime <-- json["starttime"]
//        endtime <-- json["endtime"]
//        startdate <-- json["startdate"]
//        enddate <-- json["enddate"]
//        profile <-- json["profile"]
//        status <-- json["status"]
//        locations <-- json["locations"]
//        production <-- json["production"]
//        isproduction <-- json["isproduction"]
//        attributes <-- json["attributes"]
//        defaultscheduledescription <-- json["defaultscheduledescription"]
//        defaultschedulestarttime <-- json["defaultschedulestarttime"]
//        defaultscheduleendtime <-- json["defaultscheduleendtime"]
//        defaultschedulestart <-- json["defaultschedulestart"]
//        defaultscheduleend <-- json["defaultscheduleend"]
//        
//    }
//}


extension Event: RestResource {
    static func restName() -> String { return "api/event/" }
    func restId() -> String { return "\(id)" }
}
