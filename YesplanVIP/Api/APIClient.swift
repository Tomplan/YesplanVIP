//
//  APIClient.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import Alamofire
//import PromisedFuture
import PromiseKit

class APIClient {
    
    private static func apiGet<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Promise<T> {
        guard let url =  route.urlRequest else {
//            print("urlerror: ")
            
            return Promise(error: APIError.responseUnsuccessful)
        }
//        print("url:", url)
        return Promise { seal in
        

        URLSession.shared.dataTask(with: url) { data, response, error in
          guard let data = data else { return }
            do {
            let result = try JSONDecoder().decode(T.self, from: data)
            seal.fulfill(result)

//            let genericError = NSError(
//              domain: "PromiseKitTutorial",
//              code: 0,
//              userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
//            seal.reject(error ?? genericError)
          }
            catch {
                print(error)
                print(response)
            }

        }.resume()
//            firstly {
//            URLSession.shared.dataTask(.promise, with: url)
//            }
////            .validate()
//            .map {
//                try JSONDecoder().decode(T.self, from: $0.data)
            }
    }
    
    
//    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, APIError>)->Void) -> DataRequest {
//        return  Alamofire.request(route)
//                        .response (decoder: decoder){ (response: DataResponse<T>) in
//                            completion(response)
//        }
//    }

        
//        @discardableResult
//        private static func performRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (AFResult<T>) -> Void) -> DataRequest {
//            return Alamofire.request(route)
//                .validate(statusCode: 200..<300)
//            .responseData { response in
//                   debugPrint(response)
//               }
//            .responseData { response in
//                guard let data = response.result.value else {
//                print("nop")
//                return
//              }
//              completion(.success(data))
//            }
//                  .responseDecodable { (response: DataResponse<T>) in
//                    guard response.result.isSuccess else {
//                      print("🥶 Error on login: \(String(describing: response.error))")
//                      return
//                    }
////                    completion(response.result)
//                    completion(.success(value))
//                }
//                .responseJSON(completionHandler: <#T##(DataResponse<Any>) -> Void#>)
//
//                Alamofire.request(route)
//                .responseDecodable(decoder: decoder) { (response: AlamofireDataResponse<T>) in
//                    completion(response.result)
//            }
//        }
//
//    @discardableResult
//        func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Future<T> {
//        return Future(operation: { completion in
////            Alamofire.request(route).response(completionHandler:
////                Alamofire.request(route).responseDecodable(decoder: decoder,
//            Alamofire.request(route).response(completionHandler:
//
////                                                           completionHandler:
//                { (response: DataResponse<T>) in
//                switch response.result {
//                case .success(let value):
//                    completion(.success(value))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            })
//        })
//    }
    
//    func makeUrlRequest(url: URL) throws -> URLRequest {
//        var rq = URLRequest(url: url)
//        rq.httpMethod = "POST"
//        rq.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        rq.addValue("application/json", forHTTPHeaderField: "Accept")
//        rq.httpBody = try JSONEncoder().encode(Events)
//        return rq
//    }
    
//    @discardableResult
//    private static func promiseRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Promise<T> {
//        return firstly {
//            URLSession.shared.dataTask(with: route)
//            
//        }
//    }
    
//    static func promiseEvents(_ path: String) -> Promise<Events> {
//        return promiseRequest(route: APIRouter.events(path: path))
//    }
    
    
    static func multipletest(_ path: String) -> Promise<Tasks> {
//        print("APICLIENT")
        return apiGet(route: APIRouter.multipletest(path: path))
    }
    
    static func events(_ path: String) -> Promise<Events> {
        return apiGet(route: APIRouter.events(path: path))
    }

    
    static func groups(_ path: String) -> Promise<Groups> {
        return apiGet(route: APIRouter.groups(path: path))
    }
    
    static func tasks(_ path: String) -> Promise<Tasks> {
        return apiGet(route: APIRouter.tasks(path: path))
    }
    
    static func profiles(_ path: String) -> Promise<Profiles> {
        return apiGet(route: APIRouter.profiles(path: path))
    }
    
    static func resourcebookingId(_ id: String) -> Promise<Resourcebooking> {
        return apiGet(route: APIRouter.resourcebookingId(id: id))
    }
    
    static func resourcebookings(_ path: String) -> Promise<Resourcebookings> {
        return apiGet(route: APIRouter.resourcebookings(path: path))
    }

    static func resources(_ path: String) -> Promise<Resources> {
        return apiGet(route: APIRouter.resources(path: path))
    }

    static func resourcesSchedules(_ path: String, _ query: [String:String]) -> Promise<ResourcesSchedulesFromTo> {
        print("path*: ", path)
        print("query*: ", query)
        return apiGet(route: APIRouter.resourcesSchedules(path: path, query: query))
       }
    
    static func resourcesSchedulesFromTo(_ path: String) -> Promise<ResourcesSchedulesFromTo> {
        return apiGet(route: APIRouter.resourcesSchedulesFromTo(path: path))
    }
    
    static func statuses(_ path: String) -> Promise<Statuses> {
        return apiGet(route: APIRouter.statuses(path: path))
    }
    
    static func event(_ id: String) -> Promise<Event> {
        return apiGet(route: APIRouter.event(id: id))
    }
    
    static func eventSchedule(_ id: String) -> Promise<EventSchedule> {
        return apiGet(route: APIRouter.eventSchedule(id: id))
    }
    
    static func eventResourcebookings(_ id: String) -> Promise<[Resourcebooking]> {
        return apiGet(route: APIRouter.eventResourcebookings(id: id))
    }
    
    static func eventAttachments(_ id: String) -> Promise<[EventAttachment]> {
        return apiGet(route: APIRouter.eventAttachments(id: id))
    }
    
    static func nextResourcesSchedulesFromTo(_ url: URL) -> Promise<ResourcesSchedulesFromTo> {
        return apiGet(route: APIRouter.nextResourcesSchedulesFromTo(url: url))
    }
    
    static func resourceId(_ id: String) -> Promise<Resource> {
        return apiGet(route: APIRouter.resourceId(id: id))
    }
    
    static func locationId(_ id: String) -> Promise<Location> {
        return apiGet(route: APIRouter.locationId(id: id))
    }
}
