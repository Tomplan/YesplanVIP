//
//  Schedules.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 4/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum Schedules {
    case shift(Shift)
    case scheduleBreak(ScheduleBreak)
    case schedule(Schedule)
    case lock(Lock)
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
            print("tjatjatja")
            throw Failure.NotImplemented
        }
    }
}
