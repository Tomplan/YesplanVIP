////
////  APIRouter.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 12/10/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {

    case events(path: String)
    case groups(path: String)
    case profiles(path: String)
    case resourcebookings(path: String)
    case resources(path: String)
    case resourcesSchedulesFromTo(path: String)
    case statuses(path: String)
    case tasks(path: String)


////    case login(email:String, password:String)
////    case articles(userId: Int)
////    case article(id: Int)
//
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
            case .events
                ,.groups
                ,.profiles
                ,.resourcebookings
                ,.resources
                ,.resourcesSchedulesFromTo
                ,.statuses
                ,.tasks
                :return .get
            
//        case .login:
//            return .post
//        case .articles, .article:
//            return .get
            
        }
    }

    // MARK: - Path
    private var path: String {
        
        switch self {
        case .events(let path): return "/api/events/\(path)"
        case .groups(let path): return "/api/groups/\(path)"
        case .profiles(let path): return "/api/profiles/\(path)"
        case .resourcebookings(let path): return "/api/resourcebookings/\(path)"
        case .resources(let path): return "/api/resources/\(path)"
        case .resourcesSchedulesFromTo(let path): return "/api/resources/\(path)/schedules"
        case .statuses(let path): return "/api/statuses/\(path)"
        case .tasks(let path): return "/api/tasks/\(path)"

//
////        case .login:
////            return "/login"
////        case .articles(let userId):
////            return "/articles/all.json?userID=\(userId)"
////        case .article(let id):
////            return "/article/article.json?id=\(id)"
        }
    }


    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
            case .events
                ,.groups
                ,.profiles
                ,.resourcebookings
                ,.resources
                ,.resourcesSchedulesFromTo
                ,.statuses
                ,.tasks
                :return nil
        
//        case .login(let email, let password):
//            return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
//        case .articles, .article:
//            return nil
            
        }
    }

    // MARK: - Parameters
    private var query: [String: String] {
        switch self {
        case .events
        ,.groups
        ,.profiles
        ,.resourcebookings
        ,.resources
        ,.statuses
        ,.tasks
            :return [:]
        case .resourcesSchedulesFromTo:
            return ["from": "2018-11-01", "to" : "2018-11-20"]
            //        case .login(let email, let password):
            //            return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
            //        case .articles, .article:
            //            return nil
            
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        let allowedCharacterSet = CharacterSet(charactersIn: "!*'();:@&=+$,?%#[] ").inverted
        let pathPercentEncoded = path.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!
        
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https";
        urlComponents.host = "\(UserDefaults.standard.string(forKey: "URL")!)";
        urlComponents.percentEncodedPath = "\(pathPercentEncoded)";
//        urlComponents.queryItems = ["api_key" : "\(UserDefaults.standard.string(forKey: "KEY")!)", parameters]
//        let queryItemApiKey = URLQueryItem(name: "api_key", value: "\(UserDefaults.standard.string(forKey: "KEY")!)")
//        urlComponents.queryItems?.append(queryItemApiKey)
        
        var queryItems: [URLQueryItem] = [URLQueryItem(name: "api_key", value: "\(UserDefaults.standard.string(forKey: "KEY")!)")]
        
        let optionalURLQueryItems = query.map {
            return URLQueryItem(name: $0, value: $1)
        }
        queryItems.append(contentsOf: optionalURLQueryItems)
        
        urlComponents.queryItems = queryItems
//        if let queryItems = query {
//            for (key, value) in queryItems {
//                let queryItemQuery = URLQueryItem(name: key, value: value as! String)
//                urlComponents.queryItems?.append(queryItemQuery)
//            }
//        }
//        let queryItemQuery = URLQueryItem(name: "query", value: "swift ios")
//        urlComponents.query = "api_key=\(UserDefaults.standard.string(forKey: "KEY")!)"
        
        let url = try urlComponents.url!.asURL()
        print("url: ", url)
        var urlRequest = URLRequest(url: url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                print("parameters: ", parameters)
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                print("urlRequest1: ", urlRequest)
                
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        print("urlRequest: ", urlRequest)
        return urlRequest
    }
}
