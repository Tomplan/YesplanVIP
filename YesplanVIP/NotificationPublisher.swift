//
//  NotificationPublisher.swift
//  YesplanVIP
//
//  Created by Tom Slegers on 14/02/2019.
//  Copyright © 2019 Yesplan. All rights reserved.
//

//import Foundation
import UIKit
import UserNotifications

class NotificationPublisher: NSObject {
    
    func sendNotification(title: String,
                          subtitle: String,
                          body: String,
                          badge: Int?,
                          delayInterval: Int?,
                          date: DateComponents?
        ) {
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        
        
       
//        var dateComponents = DateComponents()
//        dateComponents.hour = 20
//        dateComponents.minute = 32
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create request
        let uniqueID = UUID().uuidString // Keep a record of this if necessary
        
//        var delayTimeTrigger: UNTimeIntervalNotificationTrigger?
//
//        if let delayInterval = delayInterval {
//            delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delayInterval), repeats: false)
//        }
        
        var dateTrigger: UNCalendarNotificationTrigger?
        
        if let date = date {
            dateTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        }
        
        let request = UNNotificationRequest(identifier: uniqueID, content: notificationContent, trigger: dateTrigger)

        if let badge = badge {
            var currentBadgeCount = UIApplication.shared.applicationIconBadgeNumber
            currentBadgeCount += badge
            notificationContent.badge = NSNumber(integerLiteral: currentBadgeCount)
        }
        
//        center.getNotificationSettings { (settings) in
//            if settings.authorizationStatus != .authorized {
//                // Notifications not allowed
//            }
//        }
        
        notificationContent.sound = UNNotificationSound.default
        
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

extension NotificationPublisher: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("the notification is about to be presented")
        completionHandler([.badge, .sound, .alert])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let identifier = response.actionIdentifier
        
        switch identifier {
            
        case UNNotificationDismissActionIdentifier:
            print("notification was dismissed")
            completionHandler()
            
        case UNNotificationDefaultActionIdentifier:
            print("the user opened the app from the notification")
            completionHandler()
            
        default:
            print("the default case was called")
            completionHandler()
        }
    }
}
