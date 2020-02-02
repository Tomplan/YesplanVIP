//
//  EDAttachmentsViewCell+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

// Here we populate our TableView cell with our Model Data.
// This could be in the view controller but we like to keep
// it separate. :). Plus this can be used in other controllers without having to copy-paste code \o/

extension EDAttachmentsViewCell {
    
    func populate(with item: EventAttachment) {
        
       switch item {
               case .eventDocumentAttachment(let x):
                   
                   if let name = x.originalname {
                       lblName.text = name }
        
                   if let date = x.date {
                       lblDate.text = date.convertDateString(dateFormat: "HH:mm") }

                   if let username = x.username {
                       lblUsername.text = username }
                   
               case .eventlinkAttachment(let x):

                   let name = x.dataurl
                   lblName.text = name.absoluteString
                   
                   if let date = x.date {
                       lblDate.text = date.convertDateString(dateFormat: "HH:mm") }

                   if let username = x.username {
                       lblUsername.text = username }
                              
               }
    }
}
