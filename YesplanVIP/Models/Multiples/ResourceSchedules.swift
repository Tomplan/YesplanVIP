////
////  ResourceSchedules.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 7/10/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//

import Foundation

struct ResourceSchedulesFromTo: Codable {
    var pagination = Pagination()
    var data = [ResourceScheduleFromTo]()
}
