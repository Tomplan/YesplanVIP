//
//  Base.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation
import PromisedFuture

struct Base: Codable {
    
    var url: String = ""
    var id: String?
    var name: String?
    var _type: String?
    
    func getResourcebookingId(_ id: String) -> Future<Resourcebooking> {
                return Future(operation: { completion in
                    APIClient.resourcebookingId("\(id)")
                        .map({$0})
                        .execute(onSuccess: { items in
                            completion(.success(items))
                        }, onFailure: { error in
                            completion(.failure(error))
                        })
                })
            }
}

struct Base2: Codable {
    
    var url: String?
    var id: String?
    var name: String?
    var _type: String?
}
