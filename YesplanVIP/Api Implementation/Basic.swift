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
    
    func getAll<T:ArrowParsable & RestResource>(_ restResource:T, query: String = String() , params:[String:Any] = [String:Any]()) -> Promise<T> {
        
        var urlString = "\(allURL(restResource))"
        print("urlString: ", urlString)
        var url = URL(string: urlString)
        print("url: ", url)
        
        if query.isEmpty {
            print("empty string")
            urlString = url!.absoluteString
        } else {
            print("query: ", query)
//            urlString
            url?.appendPathComponent(query)
            print("url: ", url)
            urlString = url!.absoluteString
            print("urlString: ", urlString)
        }
//        let url = URL(string: urlString)!
//        print("url: ", url)
        let paramsApiKey: [String:Any] = ["api_key":"\(key!)"]
//        print("paramsApiKey: ", paramsApiKey)
//        var compQueryDict = [String:Any]()
//        var all = [String:Any]()
//        
        if let components = URLComponents(string: urlString) {
        print("path: ", components.percentEncodedPath)
            
        }
//        print("componentsOptional: ", components)
//        if let components = mycomponents {
//            print("components: ", components)
//
//            if let queryItems = components.queryItems {
//                print("queryItems: ", queryItems)
//                for queryItem in queryItems {
//                    compQueryDict["\(queryItem.name)"] = "\(String(describing: queryItem.value!))"
//                }
//                 all = compQueryDict.merged(with: params)
//                print("all: ", all)
//            }
//
//        }
        
        
        return ws.get(urlString, params: params.merged(with: paramsApiKey))

    }
    
    func getMore<T:ArrowParsable & RestResource>(_ restResource:T, paginationNext:String) -> Promise<T> {
        var compQueryDict = [String:Any]()

        if let url = URL(string: paginationNext) {
            print("moreUrl: ", url)
        
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        if let components = components {
            
            if let queryItems = components.queryItems {
                for queryItem in queryItems {
                    compQueryDict["\(queryItem.name)"] = "\(String(describing: queryItem.value!))"
                }
            }
        }
        }
        return getAll(T(), params: compQueryDict)
        }
    
}
