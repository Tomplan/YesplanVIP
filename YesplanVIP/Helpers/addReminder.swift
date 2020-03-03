////
////  addReminder.swift
////  YesplanVIP
////
////  Created by Tom Slegers on 02/03/2020.
////  Copyright © 2020 Yesplan. All rights reserved.
////
//
//import Foundation
//import UIKit
//import EventKit
//
//func AddReminder() {
//    var eventStore = EKEventStore()
//    var calendars:Array<EKCalendar> = []
//    
// eventStore.requestAccess(to: EKEntityType.reminder, completion: {
//  granted, error in
//  if (granted) && (error == nil) {
//    print("granted \(granted)")
//
//
//    let reminder:EKReminder = EKReminder(eventStore: eventStore)
//    reminder.title = "Must do this!"
//    reminder.priority = 2
//
//    //  How to show completed
//    //reminder.completionDate = Date()
//
//    reminder.notes = "...this is a note"
//
//
//    let alarmTime = Date().addingTimeInterval(1*60*24*3)
//    let alarm = EKAlarm(absoluteDate: alarmTime)
//    reminder.addAlarm(alarm)
//
//    reminder.calendar = eventStore.defaultCalendarForNewReminders()
//
//
//    do {
//      try eventStore.save(reminder, commit: true)
//    } catch {
//      print("Cannot save")
//      return
//    }
//    print("Reminder saved")
//  }
// })
//
//}
