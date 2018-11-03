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
//import PromiseKit

// This is our JSON Api Code
// Yes! This is all that's needed to get nice Swift models from a JSON api!!!!
// Thanks to the power of generics, ws will return what you want! (Void, JSON, Model, [Model] etc)

// Get the full documentation at https://github.com/freshOS/ws

class Yesplan: ApiInterface {
    
    var ws = WS("") // Set the Webservice base URL
    var key:String? = UserDefaults.standard.string(forKey: "KEY")
    
    init() {
        
        let defaults = UserDefaults.standard
        let urlExists = defaults.contains(key: "URL")
        if urlExists == true {
            ws = WS(UserDefaults.standard.string(forKey: "URL")!)
//            ws.defaultCollectionParsingKeyPath = UserDefaults.standard.string(forKey: "URL")!
        }
        // This will print network requests & responses to the console.
//        ws.logLevels = .info
    }
    
    func oneURL<T:ArrowParsable & RestResource>(_ r: T, id: String) -> String {
//        func oneURL<T:Codable & RestResource>(_ r: T, id: String) -> String {

        return "/\(T.restName())/\(id)"
    }
    
    func allURL<T:ArrowParsable & RestResource>(_ r: T) -> String {
//        func allURL<T:Codable & RestResource>(_ r: T) -> String {

        return "/\(T.restName())"
    }
    
    func getOne<T:ArrowParsable & RestResource>(_ restResource:T, id: String, params:[String:Any] = [String:Any]()) -> Promise<T> {
//        func getOne<T:Codable & RestResource>(_ restResource:T, id: String, params:[String:Any] = [String:Any]()) -> Promise<T> {

        return ws.get(oneURL(restResource, id: id), params: params)
//            return ws.get(oneURL(restResource, id: id), params: params)

    }
    
    func getAll<T:ArrowParsable & RestResource>(_ restResource:T, query: String = String() , params:[String:Any] = [String:Any]()) -> Promise<T> {
//    func getAll<T:Codable & RestResource>(_ restResource:T, query: String = String() , params:[String:Any] = [String:Any]()) -> Promise<T> {

        let paramsApiKey: [String:Any] = ["api_key":"\(key!)"]
        var urlString = "\(allURL(restResource))"
        let url = URL(string: urlString)
        
        if query.isEmpty {
            urlString = url!.absoluteString
        } else {
            let allowedCharacterSet = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted
            
//            if let escapedString = "www.google.com?type=c++".addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) {
//                print(escapedString)
//            }
            urlString.append(query.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!)
//            urlString = url!.absoluteString
//            print("2: ", urlString)

        }
        
        return ws.get(urlString, params: params.merged(with: paramsApiKey))

    }
    
//    func getAllRequest<T: Codable & RestResource>(t: T) -> Promise<JSON> {
//        let paramsApiKey: [String:Any] = ["api_key":"\(key!)"]
//        let path = "/\(T.restName())"
//        let request = ws.getRequest(path, params: paramsApiKey)
////        let ikke = request.fetch()
////        let request =
//
//        return request.fetch()
//    }
    
//    func getEvents() -> Promise<Events> {
//        return Promise { fulfill, reject in
//            print("okojoj")
//            let paramsApiKey: [String:Any] = ["api_key":"\(self.key!)"]
//            print("paramsApiKey", paramsApiKey)
//            let urlString = "https://dewerft.yesplan.be/api/events?api_key=\(self.key!)"
//            print("urlString", urlString)
//            let url = URL(string: urlString)
//            print("url", url)
//            guard let unwrappedUrl = url else { return }
//            print("unwrappedUrl", unwrappedUrl)
//            let request = URLRequest(url: unwrappedUrl)
//            print("request", request)
//            let session = URLSession.shared
//            print("session", session)
//            let dataPromise = session.dataTask(with: request)
//            print("dataPromise: ", dataPromise)
////            _ = dataPromise.asDictionary().then { }
//            firstly {
//                URLSession.shared.dataTask(.promise, with: rq)
//                }.compactMap { data, _ in
//                    try JSONSerialization.jsonObject(with: data) as? [String: Any]
//                }.then { json in
//                    //…
//            }
//
//        }
//    }
    
    func getMore<T:ArrowParsable & RestResource>(_ restResource:T, paginationNext:String) -> Promise<T> {
//    func getMore<T:Codable & RestResource>(_ restResource:T, paginationNext:String) -> Promise<T> {

        var compQueryDict = [String:Any]()

        if let url = URL(string: paginationNext) {
        
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
    
//    func getResourcesQuerySchedules<T:RestResource>(_ restResource:T, query: String = String() , params:[String:Any] = [String:Any]()) -> Promise<T> {
//        print("getResourcesQuerySchedules")
//        let paramsApiKey: [String:Any] = ["api_key":"\(key!)"]
//        var urlString = "/resources/resource"
//        let url = URL(string: urlString)
//        
//        if query.isEmpty {
//            urlString = url!.absoluteString
//        } else {
//            let allowedCharacterSet = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted
//            
//            //            if let escapedString = "www.google.com?type=c++".addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) {
//            //                print(escapedString)
//            //            }
//            urlString.append(query.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!)
//            urlString.append("/schedules")
//            print("urlString: ", urlString)
//            //            urlString = url!.absoluteString
//            //            print("2: ", urlString)
//            
//        }
//        return ws.get(urlString, params: params.merged(with: paramsApiKey))
//    }
//    
}

