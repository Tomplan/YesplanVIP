//
//  EventAttachment.swift
//  YesplanVIP
//
//  Created by Tom Slegers on 02/02/2020.
//  Copyright © 2020 Yesplan. All rights reserved.
//

import Foundation

enum EventAttachment {

case eventDocumentAttachment(EventDocumentAttachment)
case eventlinkAttachment(EventLinkAttachment)

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


extension EventAttachment: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .eventDocumentAttachment(let eventAttachment): try container.encode(eventAttachment)
        case .eventlinkAttachment(let eventAttachment): try container.encode(eventAttachment)
       
        }
    }
}

extension EventAttachment: Decodable {
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(EventDocumentAttachment.self) {
            self = .eventDocumentAttachment(x)
        } else if
            let x = try? container.decode(EventLinkAttachment.self) {
            self = .eventlinkAttachment(x)
        } else {
            throw Failure.NotImplemented
        }
    }
}
