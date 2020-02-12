////
////  SetupCalendarPicker.swift
////  YesplanVIP
////
////  Created by Tom Slegers on 12/02/2020.
////  Copyright © 2020 Yesplan. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//
//@objc class TestClass {
//
//    class func setupCalendarPicker() {
//        //Swipe Gestures
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
//            
//        leftSwipe.direction = .left
//        rightSwipe.direction = .right
//
//        self.view.addGestureRecognizer(leftSwipe)
//        self.view.addGestureRecognizer(rightSwipe)
//        
//        @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
//                  
//              if (sender.direction == .left) {
//                  calendarDayPlus()
//              }
//                  
//              if (sender.direction == .right) {
//                  calendarDayMinus()
//              }
//          }
//          
//          @objc func userDefaultsDidChange(){
//              doSomething()
//          }
//        
//        @objc func calendarLeft(sender: AnyObject) {
//            calendarDayMinus()
//        }
//        
//        func calendarDayMinus() {
//            datePicker.date = Calendar.current.date(byAdding: .day, value: -1, to: datePicker.date)!
//            doSomething()
//        }
//        
//        @objc func calendarRight(sender: AnyObject) {
//            calendarDayPlus()
//        }
//        
//        func calendarDayPlus() {
//            datePicker.date = Calendar.current.date(byAdding: .day, value: 1, to: datePicker.date)!
//            doSomething()
//            self.datePicker.removeFromSuperview()
//        }
//    }
//}
