////
////  AppDelegate.swift
////  YesplanVIP
////
////  Created by Techcc - FOH - Video on 13/08/18.
////  Copyright © 2018 Yesplan. All rights reserved.
////
//// dewerft.yesplan.be
//// C857C01360BB5777DABE5B7EE6594CD1
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        api = Yesplan()

        //        ShortcutParser.shared.registerShortcuts()
        
        // Create a new window for the window property that
        // comes standard on the AppDelegate class. The UIWindow
        // is where all view controllers and views appear.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Set the initial View Controller to  instance of ViewController
        window?.rootViewController = RootViewController()
        
        // Present the window
        window?.makeKeyAndVisible()
        
        return true
    }
    
    //    func applicationDidBecomeActive(_ application: UIApplication) {
    //        // handle any deeplink
    //        Deeplinker.checkDeepLink()
    //    }
    
    // MARK: Shortcuts
    //    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
    //        completionHandler(Deeplinker.handleShortcut(item: shortcutItem))
    //    }
}

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var rootViewController: RootViewController {
        return window!.rootViewController as! RootViewController
    }
    
    var URL: String {
        let url: String = String()
        return url
    }
    var Key: String {
        let key: String = String()
        return key
    }
}
