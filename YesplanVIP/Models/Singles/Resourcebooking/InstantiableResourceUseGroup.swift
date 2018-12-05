//
//  InstantiableResourceUseGroup.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 7/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

struct InstantiableResourceUseGroup: Codable {
    var url: String
    var id: String
    var _type: InstantiableResourceUseGroupType
    var number: Double
    var resource: ResourceUseResource? // Resource Location_Id or Resource_Id or Placeholder_Id
    var children: [InstantiableResourceUse] // (instantiable resource use)*
    var event: Base? // tom // NOT Event_Id, Event_Id or Schedule
    var actualnumber: Double?
}

enum InstantiableResourceUseGroupType: String, Codable {
    case resourcebookinggroup
}
