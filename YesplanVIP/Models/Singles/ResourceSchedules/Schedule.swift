////
////  Schedule.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 7/10/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//

import Foundation

struct Schedule: Codable {
    var scheduletype: String
    var resourcebooking: Base
    var start: String // (timestamp)
    var end: String  // (timestamp)
    var actualstart: String? //    null | string (timestamp)
    var actualend: String? //    null | string (timestamp)
}
