//
//  Constants.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 20/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct K {
    struct ProductionServer {
        static var baseURL = "http://itechnodev.com/api"
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
