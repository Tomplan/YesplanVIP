//
//  LoginWorker.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 14/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Alamofire
import then
import ws
import Arrow

class LoginWorker
{
//    var ikke: Bool = Bool()
//    var error
    
    func verifyUrl(urlString: String?) -> Promise<(Bool, String?)> {
    return Promise { resolve, reject in
        
        
        
    Alamofire.request(urlString!)
//        .validate()
        .responseJSON { response in
            
            print(response)
            
//            var ikke: Bool
//            var error: String?
            
            switch response.result {
            case .success( _):
                resolve((true, nil))
                
            case .failure(let error):
//                print("error: ", error)
                    if let error = error as? AFError {
//                        print("AFERROR")
                        switch error {
                        case .invalidURL(let url):
//                            print("Invalid URL: \(url) - \(error.localizedDescription)")
                            resolve((false, "Invalid URL: \(url) - \(error.localizedDescription)"))

                        case .parameterEncodingFailed( _):
//                            print("Parameter encoding failed: \(error.localizedDescription)")
//                            print("Failure Reason: \(reason)")
                            resolve((false, "AFError: \(error.localizedDescription)"))

                        case .multipartEncodingFailed( _):
//                            print("Multipart encoding failed: \(error.localizedDescription)")
//                            print("Failure Reason: \(reason)")
                            resolve((false, "AFError: \(error.localizedDescription)"))

                        case .responseValidationFailed(let reason):
//                            print("Response validation failed: \(error.localizedDescription)")
//                            print("Failure Reason: \(reason)")
                            
                            switch reason {
                                
                            case .dataFileNil, .dataFileReadFailed:
//                                print("Downloaded file could not be read")
                                resolve((false, "AFError: \(error.localizedDescription)"))

                            case .missingContentType(_):
//                                print("Content Type Missing: \(acceptableContentTypes)")
                                resolve((false, "AFError: \(error.localizedDescription)"))

                            case .unacceptableContentType( _, _):
//                                print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                                resolve((false, "AFError: \(error.localizedDescription)"))

                            case .unacceptableStatusCode( _):
//                                print("Response status code was unacceptable: \(code)")
                                resolve((false, "AFError: \(error.localizedDescription)"))

                            }
                        case .responseSerializationFailed( _):
//                            print("Response serialization failed: \(error.localizedDescription)")
//                            print("Failure Reason: \(reason)")
                            resolve((false, "AFError: \(error.localizedDescription)"))

                        }
                        
//                        print("Underlying error: \(error.underlyingError)")
                    } else if let error = error as? URLError {
//                        print("URLError")
                       
//                        print("\(error.localizedDescription)")
                        resolve((false, "Url error: \(error.localizedDescription)"))

                    } else {
//                        print("Unknown error: \(error)")
                        resolve((false, "Unknown error: \(error.localizedDescription)"))

                    }
                }
            }
        }
    }
}
