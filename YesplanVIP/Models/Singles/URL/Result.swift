//
//  Result.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 10/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error, T: AutoCodable  {
    case success(T)
    case failure(U)
}
