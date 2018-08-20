//
//  UserDefaults+Extension.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 18/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import Foundation

extension UserDefaults {
    func contains(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
