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

    case events
    case groups
    case tasks

//     var object: Any {
//        switch self {
//        case .events: return Events()
//        case .groups: return Groups()
//        case .tasks: return Tasks()
//        }
//    }
////    case login(email:String, password:String)
////    case articles(userId: Int)
////    case article(id: Int)
//
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
            case .events
                ,.groups
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
        case .events: return "/events"
        case .groups: return "/groups"
        case .tasks: return "/tasks"
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
                ,.tasks
            :return nil
//        case .login(let email, let password):
//            return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
//        case .articles, .article:
//            return nil
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try UserDefaults.standard.string(forKey: "URL")!.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

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

        return urlRequest
    }
}
