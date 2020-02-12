//
//  Network Functions.swift
//  YesplanVIP
//
//  Created by Tom Slegers on 12/02/2020.
//  Copyright © 2020 Yesplan. All rights reserved.
//

import Foundation
import Network
import SwiftUI

extension UIViewController {
    
    // Just make sure actionTitles and actions array the same count. Pass nil if you don't need any action handler closure.
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

// Use:
// popupAlert(title: "Warning", message: "The Internet is not available", actionTitles: ["OK", "Retry Connection"], actions: [{action1 in print("OK")}, {action2 in print("Retry")}])}
