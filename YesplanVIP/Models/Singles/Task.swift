//
//  Task.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 2/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//
import Foundation
import Arrow
import then

//var task: [String : Any] = [:]

struct Task {
    
    var url: URL = URL(string: "http://")!
    var id: String = ""
    var owner: User?
    var owningteam: Usergroup?
    var owninggroup: Usergroup?
    var status: String = ""
    var name: String?
    var team: String = ""
    var cost: Int = 0
    var due: String = "no deadline" //timestamp
    var start: String? //timestamp
    var description: String?
    var event: Base?    //
    var assignedby: String?
    var assignedto: String?
    var duration: String?

}


extension Task: ArrowParsable {
    public mutating func deserialize(_ json: JSON) {
        
        url <-- json["url"]
        id <-- json["id"]
        owner <-- json["owner"]
        owningteam <-- json["owningteam"]
        owninggroup <-- json["owninggroup"]
        status <-- json["status"]
        name <-- json["name"]
        team <-- json["team"]
        cost <-- json["cost"]
        due <-- json["due"]
        start <-- json["start"]
        description <-- json["description"]
        event <-- json["event"]
        assignedby <-- json["assignedby"]
        assignedto <-- json["assignedto"]
        duration <-- json["duration"]
    }
}

extension Task: RestResource {
    static func restName() -> String { return "api/task/" }
    func restId() -> String { return "\(id)" }
}
