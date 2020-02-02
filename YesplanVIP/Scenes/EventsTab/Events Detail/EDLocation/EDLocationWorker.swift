//
//  EDLocationWorker.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
//import PromisedFuture
import PromiseKit

class EDLocationWorker
{
    func getEvent(_ id: String) -> Promise<Event> {
           return firstly {
               APIClient.event("\(id)")
           }
               .map({$0})
               
       }
    
//    func getEvent(_ id: String) -> Future<Event> {
//        return Future(operation: { completion in
//            APIClient.event("\(id)")
//                .map({$0})
//                .execute(onSuccess: { items in
//                    completion(.success(items))
//                }, onFailure: { error in
//                    completion(.failure(error))
//                })
//        })
//    }
}
