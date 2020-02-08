//
//  TaskAttachment.swift
//  YesplanVIP
//
//  Created by Tom Slegers on 02/02/2020.
//  Copyright © 2020 Yesplan. All rights reserved.
//

import Foundation

enum TaskAttachment {

case taskDocumentAttachment(TaskDocumentAttachment)
case tasklinkAttachment(TaskLinkAttachment)

    // voorlopig is de volgende code niet in gebruik!!!
    
//    var dataurl: URL {
//        switch self {
//        case .eventDocumentAttachment(let x): let url = x.dataurl; return url
//        case .eventlinkAttachment(let x): let url = x.dataurl; return url
//        }
//    }
//
//    var name: String? {
//        switch self {
//        case .eventDocumentAttachment(let x): let name = x.originalname; return name
//        case .eventlinkAttachment(let x): let name = x.dataurl; return name.absoluteString
//        }
//    }
//
//    var date: String? {
//        switch self {
//        case .eventDocumentAttachment(let x): let date = x.date; return date
//        case .eventlinkAttachment(let x): let date = x.date; return date
//        }
//    }
//
//    var username: String? {
//          switch self {
//          case .eventDocumentAttachment(let x): let username = x.username; return username
//          case .eventlinkAttachment(let x): let username = x.username; return username
//          }
//      }
    
    // tot hier!!!
}


extension TaskAttachment: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .taskDocumentAttachment(let taskAttachment): try container.encode(taskAttachment)
        case .tasklinkAttachment(let taskAttachment): try container.encode(taskAttachment)
       
        }
    }
}

extension TaskAttachment: Decodable {
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(TaskDocumentAttachment.self) {
            self = .taskDocumentAttachment(x)
        } else if
            let x = try? container.decode(TaskLinkAttachment.self) {
            self = .tasklinkAttachment(x)
        } else {
            throw Failure.NotImplemented
        }
    }
}
