//
//  EventLinkAttachment.swift
//  YesplanVIP
//
//  Created by Tom Slegers on 02/02/2020.
//  Copyright © 2020 Yesplan. All rights reserved.
//

import Foundation

struct EventLinkAttachment: Codable {
      
        var event: Base
        var comment: String?
        var date: String?
        var username: String?
        var dataurl: URL
        var holder: Base2
}
