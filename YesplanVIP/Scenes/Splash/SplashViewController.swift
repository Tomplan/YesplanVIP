//
//  SplashViewController.swift
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

class SplashViewController: UIViewController {
    
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(activityIndicator)
        
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        
        makeServiceCall()
    }
    
    private func makeServiceCall() {

        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.activityIndicator.stopAnimating()
            
            ///// Create autofillCompanyURL and autofillApiKey in Userdefaults if not existing
          
            if UserDefaults.standard.bool(forKey: "autofillCompanyURLCheck") {
                UserDefaults.standard.set(true, forKey: "autofillCompanyURLCheck")

            } else {
                let array: [String] = []
                UserDefaults.standard.set(array, forKey: "autofillCompanyURL")
                UserDefaults.standard.set(true, forKey: "autofillCompanyURLCheck")
            }
            
            if UserDefaults.standard.bool(forKey: "autofillApiKeyCheck") {
                UserDefaults.standard.set(true, forKey: "autofillApiKeyCheck")

            } else {
                let array: [String] = []
                UserDefaults.standard.set(array, forKey: "autofillApiKey")
                UserDefaults.standard.set(true, forKey: "autofillApiKeyCheck")
            }
            
            //// Check if User is Logged In
            
            if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
                print(UserDefaults.standard.bool(forKey: "LOGGED_IN"))
                AppDelegate.shared.rootViewController.switchToMainScreen()
            } else {
                print(UserDefaults.standard.bool(forKey: "LOGGED_IN"))
                AppDelegate.shared.rootViewController.showLoginScreen()
            }
        }
    }
}