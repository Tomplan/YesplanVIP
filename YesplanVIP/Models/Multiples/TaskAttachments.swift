//
//  TaskAttachments.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct TaskAttachments: Codable {
    
    var pagination = Pagination()
    var data = [TaskAttachment]()
}
