//
//  Api.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import then

// This is our Api interface.
// In theory we could use ws directly in controllers but this wouldn't be very clean.
// Here we invert the depedency by puting an <ApiInterface> interface between view Controllers
// and Networking code.
// Thanks to this layer of abstraction, we could even swap api implementation at runtime if we'd like to !
// See "Dependency inversion principle" for more details.

protocol ApiInterface {
    func fetchPhotos() -> Promise<[Photo]>
    func fetchEvents() -> Promise<Events>
    
    func fetchEvent(id: String) -> Promise<Event>
}

var api: ApiInterface!
