//
//  RestResource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 26/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import ws
import Alamofire
import Arrow
import Foundation
import then

public protocol RestResource {
    static func restName() -> String
    func restId() -> String
}

public func oneURL<T:ArrowParsable & RestResource>(_ r: T, id: String) -> String {
    return "/\(T.restName())/\(id)"
}

public func allURL<T:ArrowParsable & RestResource>(_ r: T) -> String {
    return "/\(T.restName())"
}

extension WS {
    
    public func getOne<T:ArrowParsable & RestResource>(_ restResource:T, id: String, params:[String:Any] = [String:Any]()) -> Promise<T> {
        let paramsApiKey: [String:Any] = ["api_key":"4A0863B77CDA66EAE18095E1947048D9"]
        return get(oneURL(restResource, id: id), params: params.merged(with: paramsApiKey))
    }
    
    public func getAll<T:ArrowParsable & RestResource>(_ restResource:T, params:[String:Any] = [String:Any]()) -> Promise<T> {
        let paramsApiKey: [String:Any] = ["api_key":"4A0863B77CDA66EAE18095E1947048D9"]
        return get(allURL(restResource), params: params.merged(with: paramsApiKey))
    }
    
    public func getMore<T:ArrowParsable & RestResource>(_ restResource:T, pagination:String) -> Promise<T> {
        
        let url = URL(string: pagination)!
        var compQueryDict = [String:Any]()
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        if let components = components {
            
            if let queryItems = components.queryItems {
                for queryItem in queryItems {
                    compQueryDict["\(queryItem.name)"] = "\(String(describing: queryItem.value!))"
                }
            }
        }
        return getAll(T(), params: compQueryDict)
    }
    
}


