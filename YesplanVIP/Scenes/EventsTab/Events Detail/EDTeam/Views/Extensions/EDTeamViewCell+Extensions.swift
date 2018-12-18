////
////  EDTeamViewCell+Extensions.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 11/11/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//
//import Foundation
//
//// Here we populate our TableView cell with our Model Data.
//// This could be in the view controller but we like to keep
//// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/
//
//extension EDTeamViewCell {
//    
//    func populate(with resourcebooking: Resourcebooking) {
//        var name = String()
//        var start = String()
//        var end = String()
//        
//        switch resourcebooking {
//        case .bulkResourceUse(let x):
//            print("bulk", x.resource.name)
//        case .freeFormResourceUse(let x):
//            print("free", x.resource.name)
//        case .instantiableResourceUse(let x):
//            print("inst", x.resource.name)
//            name = x.resource.name
//            if let starttime = x.start.convertDateString(dateFormat: "HH:mm") { start = starttime }
//            if let endtime = x.end.convertDateString(dateFormat: "HH:mm") { end = endtime }
//        case .instantiableResourceUseGroup(let x):
//            print("group", x.children.compactMap { $0.resource.name})
//            name = (x.children.compactMap { $0.resource.name})[0]
//            lblName.text = name
//            if let starttime = (x.children.compactMap { $0.start })[0].convertDateString(dateFormat: "HH:mm") {
//                start = starttime }
//            if let endtime = (x.children.compactMap { $0.end })[0].convertDateString(dateFormat: "HH:mm") {
//                end = endtime }
//        case .resourceSetUse(let x):
//            print("set", x.children.compactMap { $0.id})
//            print("name",  x.children.compactMap { $0.resource.name } )
////            name = x.children.compactMap { $0.resource.name}.compactMap { $0 }
//            name = "name"
//            start = "time"
//            end = "time"
////            if let starttime = (x.children.compactMap { $0.start })[0].convertDateString(dateFormat: "HH:mm") {
////                start = starttime }
////            if let endtime = (x.children.compactMap { $0.end })[0].convertDateString(dateFormat: "HH:mm") {
////                end = endtime }
//        }
//        lblName.text =  name
//        lblTime.text =  " \(start) - \(end)"
//        
//    }
//}
