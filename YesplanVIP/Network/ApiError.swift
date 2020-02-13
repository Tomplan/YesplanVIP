//
//  ApiError.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case noNetwork(error: Error?)
    case general(error: Error?)
    case justerror
}

