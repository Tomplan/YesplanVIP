//
//  Yp.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 10/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum Yp {
    case events
    case groups
    case tasks
}

extension Yp: Endpoint {
    var base: String {
        let defaults = UserDefaults.standard
        let urlExists = defaults.contains(key: "URL")
        if urlExists == true {
            return defaults.string(forKey: "URL")!
        } else {
            return "https://demo.yesplan.be"
        }
    }
    var path: String {
        switch self {
        case .events: return "/api/events/"
        case .groups: return "/api/groups/"
        case .tasks: return "/api/tasks/"
        }
    }
    
}
