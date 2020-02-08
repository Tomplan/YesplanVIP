//
//  EventDocumentAttachment.swift
//  YesplanVIP
//
//  Created by Tom Slegers on 02/02/2020.
//  Copyright © 2020 Yesplan. All rights reserved.
//

import Foundation

struct TaskDocumentAttachment: Codable {
    
    var task: Base
    var originalname: String?
    var comment: String?
    var date: String?
    var username: String?
    var datatype: String
    var dataurl: URL
    var holder: Base2
}
