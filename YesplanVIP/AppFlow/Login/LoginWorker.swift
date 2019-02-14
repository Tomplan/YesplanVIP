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
    func verifyUrl(urlString: String?) -> Promise<(Bool, String?)> {
    return Promise { resolve, reject in
        
        
        
    AF.request(urlString!)
        .responseJSON { response in

            switch response.result {
            case .success( _):
                resolve((true, nil))
                
            case .failure(let error):
                    if let error = error as? AFError {
                        switch error {
                        case .invalidURL(let url):
                            resolve((false, "Invalid URL: \(url) - \(error.localizedDescription)"))

                        case .parameterEncodingFailed( _):
                            resolve((false, "AFError: \(error.localizedDescription)"))

                        case .multipartEncodingFailed( _):
                            resolve((false, "AFError: \(error.localizedDescription)"))

                        case .responseValidationFailed(let reason):
                            
                            switch reason {
                                
                            case .dataFileNil, .dataFileReadFailed:
                                resolve((false, "AFError: \(error.localizedDescription)"))

                            case .missingContentType(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))

                            case .unacceptableContentType( _, _):
                                resolve((false, "AFError: \(error.localizedDescription)"))

                            case .unacceptableStatusCode( _):
                                resolve((false, "AFError: \(error.localizedDescription)"))

                            }
                        case .responseSerializationFailed( _):
                            resolve((false, "AFError: \(error.localizedDescription)"))

                        case .explicitlyCancelled:
                            resolve((false, "AFError: \(error.localizedDescription)"))

//                        case .certificatePinningFailed:
//                            resolve((false, "AFError: \(error.localizedDescription)"))
                        case .parameterEncoderFailed(let reason):
                            switch reason {
                            case .encoderFailed(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .missingRequiredComponent(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            }
                        case .serverTrustEvaluationFailed(let reason):
                            switch reason {
                            case .certificatePinningFailed(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .defaultEvaluationFailed(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .hostValidationFailed(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .noCertificatesFound:
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .noPublicKeysFound:
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .noRequiredEvaluator(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .policyApplicationFailed(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .publicKeyPinningFailed(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .revocationCheckFailed(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .revocationPolicyCreationFailed:
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            case .settingAnchorCertificatesFailed(_):
                                resolve((false, "AFError: \(error.localizedDescription)"))
                            }
                        }
                        
                    } else if let error = error as? URLError {
                        resolve((false, "Url error: \(error.localizedDescription)"))

                    } else {
                        resolve((false, "Unknown error: \(error.localizedDescription)"))

                    }
                }
            }
        }
    }
}
