//
//  WSApi.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import ws
import then

// This is our JSON Api Code
// Yes! This is all that's needed to get nice Swift models from a JSON api!!!!
// Thanks to the power of generics, ws will return what you want! (Void, JSON, Model, [Model] etc)

// Get the full documentation at https://github.com/freshOS/ws

class WSApi: ApiInterface {
    
    
    
//    let ws = WS("https://jsonplaceholder.typicode.com") // Set the Webservice base URL
    let ws = WS("https://dewerft.yesplan.be/api") // Set the Webservice base URL

    init() {
        // This will print network requests & responses to the console.
//        ws.logLevels = .debug
        
    }
    
    // Set the type you want back and call the endpoint you need.
    func fetchPhotos() -> Promise<[Photo]> {
        print("Fetching photos...")
        return ws.get("/events?api_key=C857C01360BB5777DABE5B7EE6594CD1")
    }
    
    func fetchEvents() -> Promise<Events> {
        print("Fetching events...")
        return ws.get("/events?api_key=C857C01360BB5777DABE5B7EE6594CD1")
    }
    
    func fetchEvent(id: String) -> Promise<Event> {
        print("Fetching event...")
        return ws.get("/event/\(id)?api_key=C857C01360BB5777DABE5B7EE6594CD1")
    }
    
    
    
    // get JSON back instead
    // func fetchPhotos() -> Promise<[JSON]> {
    //     return ws.get("/photos")
    // }
    
    // get a Void callback
    // func fetchPhotos() -> Promise<[Void]> {
    //     return ws.get("/photos")
    // }
}
