//
//  Costmodel.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Arrow

struct Costmodel: ArrowParsable {
    var name: String?
    
    mutating func deserialize(_ json: JSON) {
        
        name <-- json["name"]
    }
}
