////
////  Extension DataRequest.swift
////  YesplanVIP
////
////  Created by Tom Slegers on 29/01/2020.
////  Copyright © 2020 Yesplan. All rights reserved.
////
////
//import Foundation
//import Alamofire
//
//// MARK: - Alamofire response handlers
//
//extension DataRequest {
////    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
////        return DataResponseSerializer { _, response, data, error in
////            guard error == nil else { return .failure(error!) }
////
////            guard let data = data else {
////                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
////            }
////
////            return responseDecodable  { try JSONDecoder().decode(T.self, from: data) }
////        }
////    }
//
//    @discardableResult
//    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
//        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
//    }
//}
