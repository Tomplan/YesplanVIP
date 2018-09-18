//
//  WSApi.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import ws
import Alamofire
import Arrow
import Foundation
import then

// This is our JSON Api Code
// Yes! This is all that's needed to get nice Swift models from a JSON api!!!!
// Thanks to the power of generics, ws will return what you want! (Void, JSON, Model, [Model] etc)

// Get the full documentation at https://github.com/freshOS/ws

class Yesplan: ApiInterface {
    
    var ws = WS("") // Set the Webservice base URL
    var key:String? = UserDefaults.standard.string(forKey: "KEY")
    
    init() {
        let defaults = UserDefaults.standard
        let check = defaults.contains(key: "URL")
        if check == true {
            ws = WS(UserDefaults.standard.string(forKey: "URL")!)
        }
        // This will print network requests & responses to the console.
        ws.logLevels = .info
    }
    
    func oneURL<T:ArrowParsable & RestResource>(_ r: T, id: String) -> String {
        return "/\(T.restName())/\(id)"
    }
    
    func allURL<T:ArrowParsable & RestResource>(_ r: T) -> String {
        return "/\(T.restName())"
    }
    
    func getOne<T:ArrowParsable & RestResource>(_ restResource:T, id: String, params:[String:Any] = [String:Any]()) -> Promise<T> {
        return ws.get(oneURL(restResource, id: id), params: params)
    }
    
    func getAll<T:ArrowParsable & RestResource>(_ restResource:T, params:[String:Any] = [String:Any]()) -> Promise<T> {
        let paramsApiKey: [String:Any] = ["api_key":"\(key!)"]
        return ws.get(allURL(restResource), params: params.merged(with: paramsApiKey))
    }
    
    func getMore<T:ArrowParsable & RestResource>(_ restResource:T, paginationNext:String) -> Promise<T> {
        
        let url = URL(string: paginationNext)!
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
