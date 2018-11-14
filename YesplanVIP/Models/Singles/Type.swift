//
//  Type.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 12/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum Type: String, Codable {
    case event
    case organization
    case person
    case contactlink
    case adhocresource
    case resource
    case resourceinstance
    case resourceplaceholder
    case location
    case profile
    case contactbooking
    case resourcebooking
    case resourcebookinggroup
    case status
    case jaspertemplate
    
    var type: String {
        switch self {
        case .event: return "event"
        case .organization: return "organization"
        case .person: return "person"
        case .contactlink: return "contactlink"
        case .adhocresource: return "adhocresource"
        case .resource: return "resource"
        case .resourceinstance: return "resourceinstance"
        case .resourceplaceholder: return "resourceplaceholder"
        case .location: return "location"
        case .profile: return "profile"
        case .contactbooking: return "contactbooking"
        case .resourcebooking: return "resourcebooking"
        case .resourcebookinggroup: return "resourcebookinggroup"
        case .status: return "status"
        case .jaspertemplate: return "jaspertemplate"
        }
    }
}


