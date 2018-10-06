//
//  RestResource.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 26/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//


import Foundation

public protocol RestResource {
    static func restName() -> String
    func restId() -> String
}


