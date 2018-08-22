//
//  Pagination.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct Pagination {
    var next: String? = ""
    var expires: String? = ""
}

extension Pagination : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        next <-- json["next"]
        expires <-- json["expires"]
    }
}
