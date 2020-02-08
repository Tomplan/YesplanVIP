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

    case multipletest(path: String)
    
    case events(path: String)
    case groups(path: String)
    case profiles(path: String)
    case resourcebookingId(id: String)
    case resourcebookings(path: String)
    case resources(path: String)
    case resourcesSchedulesFromTo(path: String)
    case resourcesSchedules(path: String, query: [String:String])
    case statuses(path: String)
    case tasks(path: String)
    
    case event(id: String)
    case eventAttachments(id: String)
    case eventSchedule(id: String)
    case eventResourcebookings(id: String)
    
    case task(id: String)
    case taskAttachments(id: String)

    case locationId(id: String)
    
    case resourceId(id: String)


    case nextResourcesSchedulesFromTo(url: URL)
////    case login(email:String, password:String)
////    case articles(userId: Int)
////    case article(id: Int)
//
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case
        
        .multipletest
            
        ,.events
        ,.groups
        ,.profiles
        ,.resourcebookingId
        ,.resourcebookings
        ,.resources
        ,.resourcesSchedulesFromTo
        ,.resourcesSchedules
        ,.statuses
        ,.tasks
        
        ,.event
        ,.eventAttachments
        ,.eventSchedule
        ,.eventResourcebookings
        
        ,.task
        ,.taskAttachments

        ,.locationId
        
        ,.resourceId
        
        ,.nextResourcesSchedulesFromTo
            :return .get
        }
    }

    // MARK: - Path
    private var path: String {
        
        switch self {
        
        case .multipletest(let path): print("APIROUTER"); return "/api/tasks/\(path)"

        case .events(let path): return "/api/events/\(path)"
        case .groups(let path): return "/api/groups/\(path)"
        case .profiles(let path): return "/api/profiles/\(path)"
        case .resourcebookingId(let id): return "/api/resourcebooking/\(id)"
        case .resourcebookings(let path): return "/api/resourcebookings/\(path)"
        case .resources(let path): return "/api/resources/\(path)"
        case .resourcesSchedulesFromTo(let path): return "/api/resources/\(path)/schedules"
            
//        case .resourcesSchedules(let path): return "/api/resources/\(path)/schedules"
            case .resourcesSchedules(let path, let query):
                print("path: ", path)
                print("query: ", query)
                return "/api/resources/\(path)/schedules"

            
        case .statuses(let path): return "/api/statuses/\(path)"
        case .tasks(let path): return "/api/tasks/\(path)"
//        case .tasks(let path): return "/api/tasks/\(path)".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!


        case .event(let id): return "/api/event/\(id)"
        case .eventAttachments(let id): return "/api/event/\(id)/attachments"
        case .eventSchedule(let id): return "/api/event/\(id)/schedule"
        case .eventResourcebookings(let id): return "/api/event/\(id)/resourcebookings"
            
        case .task(let id): return "/api/task/\(id)"
        case .taskAttachments(let id): return "/api/task/\(id)/attachments"

        case .locationId(let id): return "/api/location/\(id)"
            
        case .resourceId(let id): return "/api/resource/\(id)"
     
        case .nextResourcesSchedulesFromTo(let url):
            return url.path
            
        }
    }


    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case
        
        .multipletest
        
        ,.events
        ,.groups
        ,.profiles
        ,.resourcebookings
        ,.resourcebookingId
        ,.resources
        ,.resourcesSchedulesFromTo
        ,.statuses
        ,.tasks
        
        ,.event
        ,.eventAttachments
        ,.eventSchedule
        ,.eventResourcebookings
        
        ,.task
        ,.taskAttachments

        ,.locationId
        
        ,.resourceId

        ,.nextResourcesSchedulesFromTo
        :return nil
            
        case .resourcesSchedules:
            return nil
            

//        case .login(let email, let password):
//            return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
//        case .articles, .article:
//            return nil
            
        }
    }

    // MARK: - Query
    private var query: [String: String] {
        switch self {
        case
        
        .multipletest
        
        ,.events
        ,.groups
        ,.profiles
        ,.resourcebookingId
        ,.resourcebookings
        ,.resources
        ,.statuses
        ,.tasks
        
        ,.event
        ,.eventAttachments
        ,.eventSchedule
        ,.eventResourcebookings
        
        ,.task
        ,.taskAttachments

        ,.locationId
        
        ,.resourceId

        :return [:]
            
        case .resourcesSchedules( _, let query):
//            print("hierook: ", query)
            return query
            
        case .resourcesSchedulesFromTo:
            return ["from": "\(getCurrentShortDate())", "to" : "\(currentDatePlus14Days())"]
        case .nextResourcesSchedulesFromTo(let url):
            var queryDict = [String:String]()
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            if let components = components {
                if let queryItems = components.queryItems {
                    for queryItem in queryItems {
                        queryDict[queryItem.name] = queryItem.value
                        print("\(queryItem.name): \(String(describing: queryItem.value))")
                    }
                }
            }
            return queryDict
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let optionalURLQueryItems = query.map {
            return URLQueryItem(name: $0, value: $1)}
        let allowedCharacterSet = CharacterSet(charactersIn: "!*'();:@&=+$,?%#[] ").inverted
        let pathPercentEncoded = path.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https";
        urlComponents.host = "\(UserDefaults.standard.string(forKey: "URL")!)";
        urlComponents.percentEncodedPath = "\(pathPercentEncoded)";
        var queryItems: [URLQueryItem] = [URLQueryItem(name: "api_key", value: "\(UserDefaults.standard.string(forKey: "KEY")!)")]
        
        
        queryItems.append(contentsOf: optionalURLQueryItems)
        
        urlComponents.queryItems = queryItems

        let url = try urlComponents.url!.asURL()
        var urlRequest = URLRequest(url: url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        print("APIRouter urlRequest: ", urlRequest)
        return urlRequest
    }
}

public func  getCurrentShortDate() -> String {
    let todaysDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let DateInFormat = dateFormatter.string(from: todaysDate)
    
    return DateInFormat
}

public func currentDatePlus14Days() -> String {
    let todaysDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let DateInFormat = dateFormatter.string(from: todaysDate!)
    return DateInFormat
}
