//
//  Photo+JSON.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Arrow

// This Is our JSON to Model Mapping code. No rocket science here :)
// Notice that Arrow automatically parses the json values to the right types,
// might there be native, custom or array types !
// No `if let` s, no casting `as ? T`, no iteration on collections \o/
// The dot syntax also works for hassle-free parsing!
// `property <-- json[".resource.url.medium"]`

// Get the full documentation at https://github.com/freshOS/Arrow

extension Photo : ArrowParsable {
    
    public mutating func deserialize(_ json: JSON) {
        identifier <-- json["id"]
//        title <-- json["title"]
        imageUrl <-- json["url"]
    }
}
