//
//  Photo+Api.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

import then

// This is not absolutely needed but it's nice to handle data through
// the models.

extension Photo {
    static func fetchPhotos() -> Promise<[Photo]> {
        return api.fetchPhotos()
    }
}
