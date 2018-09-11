//
//  Children.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 22/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//


import Foundation
import Arrow
import then

enum Children {
    case event(Event)
    case group(Group)

    init(children: JSON) {
//        print("init")
        var value = Group()
        value.deserialize(children)
        print(value)
        if value._type == "group" {
            self = .group(value)
            
        } else {
            var e = Event()
            e.deserialize(children)
            self = .event(e)

        }
    }
    
//    init(encode: Children) {
//            switch encode {
//            case .event(let event):
//                print(event.url)
//            case .group(let group):
//                print("switch group")
//                print(group.url)
//        }
//    }

}


