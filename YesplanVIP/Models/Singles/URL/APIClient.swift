//
//  APIClient.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Alamofire
import PromisedFuture

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Future<T> {
        return Future(operation: { completion in
            AF.request(route).responseJSONDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        })
    }
    
    static func events(_ path: String) -> Future<Events> {
        return performRequest(route: APIRouter.events(path: path))
    }
    
    static func groups(_ path: String) -> Future<Groups> {
        return performRequest(route: APIRouter.groups(path: path))
    }
    
    static func tasks(_ path: String) -> Future<Tasks> {
        return performRequest(route: APIRouter.tasks(path: path))
    }
    
    static func profiles(_ path: String) -> Future<Profiles> {
        return performRequest(route: APIRouter.profiles(path: path))
    }
    
    static func statuses(_ path: String) -> Future<Statuses> {
        return performRequest(route: APIRouter.statuses(path: path))
    }
    
    static func resourcebookings(_ path: String) -> Future<Resourcebookings> {
        return performRequest(route: APIRouter.resourcebookings(path: path))
    }
    
//    static func login(email: String, password: String) -> Future<User> {
//        return performRequest(route: APIRouter.login(email: email, password: password))
//    }
//
//    static func userArticles(userID: Int) -> Future<[Article]> {
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.dateDecodingStrategy = .formatted(.articleDateFormatter)
//        return performRequest(route: APIRouter.articles(userId: userID), decoder: jsonDecoder)
//    }
//
//    static func getArticle(articleID: Int) -> Future<Article> {
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.dateDecodingStrategy = .formatted(.articleDateFormatter)
//        return performRequest(route: APIRouter.article(id: articleID), decoder: jsonDecoder)
//    }
}
