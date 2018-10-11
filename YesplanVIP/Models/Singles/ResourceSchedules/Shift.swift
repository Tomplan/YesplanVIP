//
//  Shift.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow


struct Shift: AutoCodable {
    var scheduletype: String = ""
    var start: String = "" // (timestamp)
    var end: String = "" // (timestamp)
    var duration: String = "" // (duration)
    var actualstart: String? //    null | string (timestamp)
    var actualend: String? //    null | string (timestamp)
    var actualstatus: String?
}

extension Shift: ArrowParsable {
    public mutating func deserialize(_ json: JSON) {
        
        scheduletype <-- json["scheduletype"]
        start <-- json["start"]
        end <-- json["end"]
        duration <-- json["duration"]
        actualstart <-- json["actualstart"]
        actualend <-- json["actualend"]
        actualstatus <-- json["actualstatus"]
    }
}
