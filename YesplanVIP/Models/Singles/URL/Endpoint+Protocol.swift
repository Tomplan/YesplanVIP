//
//  Endpoint+Protocol.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 10/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}
