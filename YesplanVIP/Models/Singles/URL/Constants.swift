//
//  Constants.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct Constants {
    struct ProductionServer {
        static let baseURL = "https://dewerft.yesplan.be/api"
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
        static let key = "api_key"
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
