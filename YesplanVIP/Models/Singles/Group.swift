//
//  Group.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation


struct Group: Codable {
    var url: String = "" // = URL(string: "http://")!
    var id: String = ""
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var name: String?
    var group: Base?
    var starttime: String? // timestamp Date and time of the start of the event.
    var endtime: String? // timestamp Date and time of the end of the event.
    var startdate: String? // date Date on which the start of the event appears in the calendar.
    var enddate: String? // date Date on which the end of the event appears in the calendar.
    var profile: Base? // NOT Profile_Id, color not transferred by Yesplan in Group_Id
    var status: Base? // Not Status_Id, backgroundcolor,...
    var locations: [Base]? // optional added by TOM, important for Children
    var production: Base?             // null or Event_Id or Group_Id
    var isproduction: Bool = false
    var attributes: Pagination? // optional added by TOM
    var _type: GroupType
    var profiles: [Base2]? // NOT Profile_Id, color not transferred by Yesplan in Group_Id
    var statuses: [Base]? // optional added by TOM
    var children: [Children] = []
}

enum GroupType: String, Codable {
    case group
}
