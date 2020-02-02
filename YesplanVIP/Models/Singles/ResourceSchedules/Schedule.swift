////
////  Schedule.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 7/10/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//

import Foundation
//import PromisedFuture

struct Schedule: Codable {
    var scheduletype: ScheduleType
    var resourcebooking: Base // not resourcebooking_Id
    var start: String // (timestamp)
    var end: String  // (timestamp)
    var actualstart: String? //    null | string (timestamp)
    var actualend: String? //    null | string (timestamp)
    
//    func getResourcebookingId(_ id: String) -> Future<Resourcebooking> {
//        return Future(operation: { completion in
//            APIClient.resourcebookingId(id)
//                .execute(onSuccess: { value in
//                completion(.success(value))
//                }, onFailure: { error in
//                    completion(.failure(error))
//                })
//        })
//    }
}

enum ScheduleType: String, Codable {
    case resourcebooking
}
