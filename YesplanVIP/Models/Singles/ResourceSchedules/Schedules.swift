//
//  Schedules.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 4/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import PromisedFuture

enum Schedules {
    case shift(Shift)
    case scheduleBreak(ScheduleBreak)
    case schedule(Schedule)
    case lock(Lock)
    
    
    var scheduletype: String {
        switch self {
        case .shift(let x):
            return x.scheduletype
        case .scheduleBreak(let x):
            return x.scheduletype
        case .schedule(let x):
            return x.scheduletype
        case .lock(let x):
            return x.scheduletype
        }
    }
    
    var date: String {
        switch self {
        case .shift(let x):
            return x.start.convertDateString(dateFormat: "yyyy-MM-dd")!
        case .scheduleBreak(let x):
            return x.start.convertDateString(dateFormat: "yyyy-MM-dd")!
        case .schedule(let x):
            return x.start.convertDateString(dateFormat: "yyyy-MM-dd")!
        case .lock(let x):
            return x.start.convertDateString(dateFormat: "yyyy-MM-dd")!
        }
    }
    
    var start: String {
        switch self {
        case .shift(let x):
            return x.start.convertDateString(dateFormat: "HH:mm")!
        case .scheduleBreak(let x):
            return x.start.convertDateString(dateFormat: "HH:mm")!
        case .schedule(let x):
            return x.start.convertDateString(dateFormat: "HH:mm")!
        case .lock(let x):
            return x.start.convertDateString(dateFormat: "HH:mm")!
        }
    }
    
    var end: String {
        switch self {
        case .shift(let x):
            return x.end.convertDateString(dateFormat: "HH:mm")!
        case .scheduleBreak(let x):
            return x.end.convertDateString(dateFormat: "HH:mm")!
        case .schedule(let x):
            return x.end.convertDateString(dateFormat: "HH:mm")!
        case .lock(let x):
            return x.end.convertDateString(dateFormat: "HH:mm")!
        }
    }
    
    var eventName: Future<String?> {
        
        switch self {
        case .shift(_):
            return Future(value: nil)
        case .scheduleBreak(_):
            return Future(value: nil)
        case .schedule(let x):
            if let id = x.resourcebooking.id {
                let ikke = x.getResourcebookingId(id)
                return ikke.map{$0.eventName}

            }
        case .lock(let x):
            if let reason = x.reason {
                return Future(value: reason)
            }
        }
        return Future(value: nil)
    }
}


extension Schedules: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .shift(let schedule): try container.encode(schedule)
        case .scheduleBreak(let schedule): try container.encode(schedule)
        case .schedule(let schedule): try container.encode(schedule)
        case .lock(let schedule): try container.encode(schedule)
        }
    }
}

extension Schedules: Decodable {
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Shift.self) {
            self = .shift(x)
        } else if let x = try? container.decode(ScheduleBreak.self) {
            self = .scheduleBreak(x)
        } else if let x = try? container.decode(Schedule.self) {
            self = .schedule(x)
        } else if let x = try? container.decode(Lock.self) {
            self = .lock(x)
        } else {
            throw Failure.NotImplemented
        }
    }
}
