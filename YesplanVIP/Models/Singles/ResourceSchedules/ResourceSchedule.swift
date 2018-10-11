//
//  ResourceSchedule.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct ResourceSchedule: AutoCodable {
//    var resource: Resource?
    var schedules: Schedules? 
}


extension ResourceSchedule: ArrowParsable {
    public mutating func deserialize(_ json: JSON) {
        
//        resource <-- json["resource"]
        schedules <-- json["schedules"]
    }
}

extension ResourceSchedule: RestResource {
    static func restName() -> String { return "api/resources/resource/" }
    func restId() -> String { return "" }
}

enum Schedules: AutoCodable {
    case shift(Shift)
    case scheduleBreak(ScheduleBreak)
    case schedule(Schedule)
    case lock(Lock)
    
    init?(schedule: JSON) throws {
        var a = Shift()
        a.deserialize(schedule)
        if a.scheduletype == "shift" {
            self = .shift(a)
            return
        }
        var b = ScheduleBreak()
        b.deserialize(schedule)
        if b.scheduletype == "break" {
            self = .scheduleBreak(b)
            return
        }
        var c = Schedule()
        c.deserialize(schedule)
        if c.scheduletype == "resourcebooking" {
            self = .schedule(c)
            return
        }
        var d = Lock()
        d.deserialize(schedule)
        if d.scheduletype == "lock" {
            self = .lock(d)
            return
        }
        throw Failure.NotImplemented
    }
}



