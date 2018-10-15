////
////  YpClient.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 10/10/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
//import Foundation
//import then
//import Alamofire
//import PromisedFuture
//import PromiseKit
//
//class YpClient: APIClient {
//    
//    
////    @discardableResult
////    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Future<T> {
////        return Future(operation: { completion in
////            Alamofire.request(route).responseJSONDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T>) in
////                switch response.result {
////                case .success(let value):
////                    completion(.success(value))
////                case .failure(let error):
////                    completion(.failure(error))
////                }
////            })
////        })
////    }
//    
////    let session: URLSession
////
////    init(configuration: URLSessionConfiguration) {
////        self.session = URLSession(configuration: configuration)
////    }
////
////    convenience init() {
////        self.init(configuration: .default)
////    }
//    
//    //in the signature of the function in the success case we define the Class type thats is the generic one in the API
////    func getEvents(from ypType: Yp, completion: @escaping (Result<Events, APIError>) -> Void) {
////        fetch(with: ypType.request , decode: { json -> Events? in
////            guard let result = json as? Events else { return  nil }
////            return result
////        }, completion: completion)
////    }
////    func getTasks(from ypType: Yp, completion: @escaping (Result<Tasks, APIError>) -> Void) {
////        fetch(with: ypType.request , decode: { json -> Tasks? in
////            guard let result = json as? Tasks else { return  nil }
////            return result
////        }, completion: completion)
////    }
////    func getGroups(from ypType: Yp, completion: @escaping (Result<Groups, APIError>) -> Void) {
////        fetch(with: ypType.request , decode: { json -> Groups? in
////            guard let result = json as? Groups else { return  nil }
////            return result
////        }, completion: completion)
////    }
////    func getFeed<T:Codable>(_ t: T, from ypType: Yp, completion: @escaping (Result<T, APIError>) -> Void) {
////        fetch(with: ypType.request , decode: { json -> T? in
////            guard let result = json as? T else { return  nil }
////            return result
////        }, completion: completion)
////    }
//}
