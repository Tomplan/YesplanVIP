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
    
    static func events() -> Future<Events> {
        return performRequest(route: APIRouter.events)
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
