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

class RootViewController: UIViewController {
    
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
        
        addChildViewController(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParentViewController: self)

    }
    
    func showLoginScreen() {

        let new = UINavigationController(rootViewController: LoginViewController())
        
        addChildViewController(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParentViewController: self)
        
        current.willMove(toParentViewController: nil)
        current.view.removeFromSuperview()
        current.removeFromParentViewController()
        
        current = new
    }
    func showWelcomeScreen() {
        
        let new = UINavigationController(rootViewController: WelcomeViewController())
        
        addChildViewController(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParentViewController: self)
        
        current.willMove(toParentViewController: nil)
        current.view.removeFromSuperview()
        current.removeFromParentViewController()
        
        current = new
    }
    
    func switchToLogout() {

        let loginViewController = LoginViewController()
        let logoutScreen = UINavigationController(rootViewController: loginViewController)
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        animateFadeTransition(to: logoutScreen)
    }
    
    func switchToMainScreen() {

        let mainViewController = MainTabBarViewController()
        let mainScreen = MainNavigationController(rootViewController: mainViewController)
        animateFadeTransition(to: mainScreen)
//        { [weak self] in self?.handleDeeplink() }
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
        
        }) { completed in
            self.current.removeFromParentViewController()
            new.didMove(toParentViewController: self)
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

