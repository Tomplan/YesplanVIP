//
//  Endpoint.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 10/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

extension Endpoint {
    var apiKey: String {
        let defaults = UserDefaults.standard
        return "api_key=\(String(describing: defaults.string(forKey: "KEY")!))"
    }
    
    var urlComponents: URLComponents {
        print("base: ", base)
        var components = URLComponents(string: base)!
        components.path = path
        print("path: ", path)
        components.query = apiKey
        print("apiKey: ", apiKey)
        print("components: ", components)
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
