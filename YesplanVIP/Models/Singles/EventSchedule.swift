//
//  EventSchedule.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct EventSchedule: Codable {
    var defaultstartidx: Int?
    var defaultstopidx: Int?
    var entries: [ScheduleEntry]
    var event: Base
}
