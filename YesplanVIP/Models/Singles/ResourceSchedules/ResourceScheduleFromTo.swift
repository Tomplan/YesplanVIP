//
//  ResourceSchedule.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct ResourceSchedulesFromTo: Codable {
    let resource: Base
    let schedules: [Schedules]
    let instancenumber: Int?
    let resourceinstance: Resourceinstance?
    let counters: [Counters]?
    let irregularhours: [Irregularhours]?
    let overtimebonuspercentages: [Overtimebonuspercentages]?
    let holidaytime: [HolidayTime]?
    let overwork: [Overwork]?
    let twentyFiveweekcounters: [TwentyFiveweekcounters]? // 52week... codingkeys!!!
}
