//
//  RootViewController.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 16/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import UserNotifications

class RootViewController: UIViewController {
    private let notificationPublisher = NotificationPublisher()
//    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)

//    private let calendarEvents = CalendarController()
    private var current: UIViewController
    
    //    var deeplink: DeeplinkType? {
    //        didSet {
    //            handleDeeplink()
    //        }
    //    }
    
    init() {
        current = SplashViewController()
        super.init(nibName:  nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("rootdidload")
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 20
//        dateComponents.minute = 35
//        notificationPublisher.sendNotification(title: "joep", subtitle: "fuck yes", body: "THIS IS WORKING", badge: 1, delayInterval: nil, date: dateComponents )
//
//        view.addSubview(activityIndicator)
//               
//            activityIndicator.frame = view.bounds
//            activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)

    }
    
    func showLoginScreen() {
        print("showLoginScreen")
        let new = UINavigationController(rootViewController: LoginViewController())
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor(r: 158, g: 158, b: 158) // color for buttons, text
        navigationBarAppearace.barTintColor = UIColor.black // color for background
        navigationBarAppearace.backgroundColor = UIColor.black
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(r: 185, g: 185, b: 185)]
        
        addChild(new)
       
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        
        current = new
    }
    
    func switchToLogout() {
        print("switchToLogout")
        let loginViewController = LoginViewController()
        let logoutScreen = UINavigationController(rootViewController: loginViewController)
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        animateFadeTransition(to: logoutScreen)
    }
    
    func switchToMainScreen() {
        print("switchToMainScreen")
        let mainViewController = MainTabBarViewController()
        let mainScreen = MainNavigationController(rootViewController: mainViewController)
        animateFadeTransition(to: mainScreen)
//        { [weak self] in self?.handleDeeplink() }
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
//        new.view.frame = view.bounds
//        new.view.alpha = 1
//        view.addSubview(new.view)
//        UIView.animate(withDuration: 2, delay: 0, options: .transitionCrossDissolve, animations: {
//            new.view.alpha = 1
//        }, completion: { _ in
//            self.current.view.removeFromSuperview()
//            self.current.removeFromParent()
//            new.didMove(toParent: self)
//            self.current = new
//        })
        transition(from: current, to: new, duration: (1.0), options: [.transitionCrossDissolve], animations: {

        }) { completed in

            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }
    
//    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
//        let initialFrame = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
//        current.willMove(toParentViewController: nil)
//        addChildViewController(new)
//        new.view.frame = initialFrame
//        
//        transition(from: current, to: new, duration: 0.3, options: [], animations: {
//            new.view.frame = self.view.bounds
//        }) { completed in
//            self.current.removeFromParentViewController()
//            new.didMove(toParentViewController: self)
//            self.current = new
//            completion?()
//        }
//    }
}

